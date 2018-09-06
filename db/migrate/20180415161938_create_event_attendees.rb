class CreateEventAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attendees do |t|
      t.references :event
      t.references :user

      t.timestamps null: false
    end
  end
end
