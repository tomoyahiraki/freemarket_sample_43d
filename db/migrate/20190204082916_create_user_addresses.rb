class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.integer :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city_name, null: false
      t.string :city_number, null: false
      t.string :building, null: false
      t.timestamps
    end
  end
end
