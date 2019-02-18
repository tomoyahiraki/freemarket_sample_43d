class AddColumsToUseraddress < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :postal_code, :integer, null: false
      add_column :users, :area_id, :integer, null: false, foreign_key: true
      add_column :users, :city_name, :string, null: false
      add_column :users, :city_number, :string, null: false
      add_column :users, :building, :string, null: false
  end
end
