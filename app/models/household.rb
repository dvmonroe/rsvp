# == Schema Information
#
# Table name: households
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  email              :string
#  phone              :string
#  address1           :string
#  address2           :string
#  city               :string
#  state              :string
#  zipcode            :string
#  contact_preference :integer          default("email")
#  attending          :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Household < ApplicationRecord
  has_many :users, dependent: :destroy

  enum contact_preference: {
    email: 0,
    text: 1,
    no_contact: 2,
  }

  def self.verifier
    ActiveSupport::MessageVerifier.new(
      Rails.application.secrets[:verifier_token]
    )
  end

  def attending_users
    users.select { |x| x.attending? }
  end

  def attending_events_for_mailer
    attending_users.flat_map(&:event_attendees).
      sort_by(&:event_id).group_by { |x| x.event.name }
  end

  def formatted_phone
    Phonelib.parse(phone).national
  end

  def mailing_address
    "#{address1} #{address2} #{city}, #{state} #{zipcode}"
  end

  def token
    Reservation::GenerateToken.new(
      household: self,
      verifier: self.class.verifier
    ).perform
  end
end
