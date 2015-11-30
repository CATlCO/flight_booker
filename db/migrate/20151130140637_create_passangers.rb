class CreatePassangers < ActiveRecord::Migration
  def change
    create_table :passangers do |t|
      t.string :name
      t.string :email
      t.integer :booking_id

      t.timestamps null: false
    end
  end
end
