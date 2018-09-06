# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Event.create(name: "Welcome BBQ", time: DateTime.new(2018,8,29,17,30,0, "-600"))

Event.create(name: "All Day Hike", time: DateTime.new(2018,8,30,7,0,0, "-600"), additional_info: "with Drew")
Event.create(name: "Morning Hike", time: DateTime.new(2018,8,30,9,0,0, "-600"), additional_info: "with Megan")
Event.create(name: "Afternoon at a Brewery", time: DateTime.new(2018,8,30,14,0,0, "-600"), additional_info: "with Megan")
Event.create(name: "Float down the Madison River", time: DateTime.new(2018,8,31,0,0,0, "-600"))

Event.create(name: "THE BIG PARTY @ The Rialto", time: DateTime.new(2018,9,1,19,0,0, "-600"))
Event.create(name: "Coffee & Pastries", time: DateTime.new(2018,9,2,10,0,0, "-600"))

wedding_list = File.read Rails.root.join('wedding_list.csv')
csv = CSV.parse(wedding_list, :headers => true)
csv.each do |row|
  next unless row["first_name"]
  hd = Household.find_or_create_by(email: row["household_email"]&.strip)
  User.find_or_create_by(first_name: row["first_name"]&.strip, last_name: row["last_name"]&.strip, household: hd)
  if row["plus_one"] == "TRUE"
    User.create(first_name: "A Guest", household: hd)
  end
end

household_list = File.read Rails.root.join('households.csv')
csv1 = CSV.parse(household_list, :headers => true)
csv1.each do |row|
  hd = Household.find_or_create_by(email: row["email"]&.strip)
  hd.update(name: row["name"]&.strip)
end
