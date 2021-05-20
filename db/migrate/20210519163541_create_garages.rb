class CreateGarages < ActiveRecord::Migration[6.1]
  def change
    create_table :garages do |t|
      t.string :make
      t.string :model
      t.string :license_plate
      t.string :year
      t.timestamps
    end
  end
end
