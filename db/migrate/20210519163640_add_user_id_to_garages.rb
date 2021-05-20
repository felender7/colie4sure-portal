class AddUserIdToGarages < ActiveRecord::Migration[6.1]
  def change
    add_reference :garages, :user, foreign_key: true
  end
end
