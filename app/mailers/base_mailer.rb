class BaseMailer < ApplicationMailer
  before_action :set_household
  after_action :save_sent_at, only: :invite

  def confirmation
    mail(to: @household.email, subject: 'Saab-Monroe Wedding | Confirmation')
  end

  def invite
    mail(to: @household.email, subject: "Saab-Monroe Wedding | You're Invited")
  end

  def invite_reminder
    mail(to: @household.email, subject: "Saab-Monroe Wedding RSVP Reminder")
  end

  def event_schedule
    mail(to: @household.email, subject: "Saab-Monroe Wedding Event Schedule")
  end

  private

  def save_sent_at
    @household.update(rsvp_sent_at: DateTime.current)
  end

  def set_household
    @household = params[:household]
  end
end
