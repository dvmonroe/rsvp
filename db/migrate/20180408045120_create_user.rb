class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.references :household

      t.boolean :attending, default: nil
      t.timestamps null: false
    end
  end
end
