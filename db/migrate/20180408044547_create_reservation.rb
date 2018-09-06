class CreateReservation < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :household

      t.json :additional_info
      t.timestamps null: false
    end
  end
end


# Wednesday
#   - Welcome BBQ 5pm

# Thursday
#   Drew
#     - All day Hike to Pine Creek Lake or hike of equivalent difficulty
#   Meg
#     - Morning Hike to the M
#     - Afternoon Brewery Tour

# Friday
#   - Tubing on the Madsion
#   - Friday evening bar

# Saturday
#   - Party at the Rialto 7pm - 12pm
#     - Live Music & finger foods. Party casual

# Sunday
#   - Goodbye Brunch


# Please Note: Most of the outdoor activities are subject to change. You are also by no means bound to the choices you've selected here!
# This is merely for us to gauge intrest so that we can make the appropriate arrangements.

# https://www.montanatrailbriefs.com/hikes/blue-and-granite-lakes
