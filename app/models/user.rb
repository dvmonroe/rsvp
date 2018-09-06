# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string
#  household_id :integer
#  attending    :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  belongs_to :household
  has_many :event_attendees, dependent: :destroy
  has_many :events, through: :event_attendees

  def name
    "#{first_name} #{last_name}"
  end
end
