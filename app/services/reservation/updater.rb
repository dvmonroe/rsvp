# frozen_string_literal: true

class Reservation::Updater < OptStruct.new
  required :params, :household

  def perform
    update_household
    if !household.attending?
      remove_attendees
    else
      update_attendance
      update_events
    end
    send_confirmation_mailer
    self
  end

  private

  def remove_attendees
    household.users.each do |u|
      u.update(attending: false)
      u.event_attendees.destroy_all
    end
  end

  def update_attendance
    household.users.each do |u|
      u.update(attending: params[:attendees].include?(u.id.to_s))
    end
  end

  def update_events
    household.users.flat_map(&:event_attendees).each(&:destroy)

    Array(params[:events]).each do |event|
      event[1][:users].each do |u_id|
        user = household.users.find(u_id)
        next unless user.attending?

        user.event_attendees.
          find_or_create_by(event_id: event[0])
      end
    end
  end

  def update_household
    household.attending = true? params[:attendance]
    household.contact_preference = params[:contact_preference]
    household.phone = Phonelib.parse(params[:contact][:phone]).sanitized
    %w(address1 address2 city state zipcode).each do |a|
      household[a] = params[:contact][a]
    end
    household.save
  end

  def send_confirmation_mailer
    # BaseMailer.with(household: household).confirmation.deliver_now
  end

  def true?(str)
    str.to_s == "true"
  end
end
