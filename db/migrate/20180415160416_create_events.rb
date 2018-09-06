class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.timestamp :time
      t.string :additional_info
    end
  end
end
