class AddSlugToGarages < ActiveRecord::Migration[6.1]
  def change
    add_column :garages, :slug, :string
    add_index :garages, :slug , unique: true
  end
end
