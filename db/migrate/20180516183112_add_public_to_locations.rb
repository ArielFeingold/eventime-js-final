class AddPublicToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :public, :boolean, default: false
  end
end
