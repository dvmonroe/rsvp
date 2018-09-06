class CreateHouseholds < ActiveRecord::Migration[5.1]
  def change
    create_table :households do |t|
      t.string :name

      t.string :email
      t.string :phone

      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.datetime :rsvp_sent_at

      t.integer :contact_preference, default: 0

      t.boolean :attending
      t.timestamps null: false
    end
  end
end
