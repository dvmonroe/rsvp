# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  name            :string
#  time            :datetime
#  additional_info :string
#

class Event < ApplicationRecord
  has_many :event_attendees
  has_many :users, through: :event_attendees

  DETAILS = {
    1 => "Meet at our house at 5:30 PM on Wednesday August 29th. There is parking along the west side of Matheson Way, on 15th Ave, and along the smaller surrounding streets. You will most likely need to make a short walk to our house from where you park.",
    2 => "Meet at our house at 8:00 AM on Thursday August 30th. From there, we will try to consolidate into 2-3 cars for the trip. We will likely need one other driver so please consider being able to drive with others if we need the help! Depending on our group's pace anticipate getting back into town around 4:00 or 5:00 PM. Please pack food, water and snacks for yourself!",
    3 => "Meet at the <a href='https://goo.gl/maps/W1vTBs9F7342'>College M Trailhead</a> on Thursday August 30th at 8:50 AM. Megan will start heading up the easy side (to the left) with whoever is there at 9:00 AM. If you arrive a bit late, go ahead and head up the trail! We will plan to hang out at the top for a bit and we will try to get a group picture! Be sure to bring some water and maybe a snack to enjoy at the top! Anticipate finishing the round-trip hike around 11:00 AM.",
    4 => "We have the mezzanine level of <a href='https://goo.gl/maps/hgQvYJ9pgEp'>MAP Brewing</a> rented out with our own bartender from 2:00 PM to 5:00 PM. Pints of beer there range from $4.00 to $5.00, and you may also order food if you'd like. If you choose to order food, they asked that we have a max of 5 people place food orders at a time. Please be aware that MT law prohibits breweries from serving an individual more than 3 pints per day.",
    5 => "We will meet at <a href='https://goo.gl/maps/zNcu4S4R4wz'>Madison River Tubing</a> on Friday August 31st at 9:30 AM, and their buses will transport us to the river at 10:00 AM. <strong>Please don't be late - they will not wait for us!</strong> They have a large parking lot where we can leave our cars while we are on the river. Please bring $23.00 per person, which will cover a tube rental as well as the bus ride there and back. If you want to rent a floating cooler to hold your beverages and snacks, they offer that as well (but please do not bring any glass!). Plan to wear a bathing suit or clothes that you don't mind getting wet, and we recommend wearing sandals that strap onto your feet or water shoes.",
    6 => "We will plan to see you at <a href='https://goo.gl/maps/hSho7Tg3NHn'>The Rialto Theater</a> on Saturday September 1st at 7:00 PM! Come ready to dance and have a great time! There is street parking along Main Street, and there is also a nearby <a href='https://goo.gl/maps/rYZBg42MRTq'>parking garage</a>. There will be plenty of appetizers and some hardy food later in the night so consider a light snack in the afternoon to tide you over.",
    7 => "Meet at our house at 10:00 AM to say goodbye to out-of-town family and friends. We will have coffee, juice, pastries and fruit!"
  }

  def details
    DETAILS[id]
  end
end
