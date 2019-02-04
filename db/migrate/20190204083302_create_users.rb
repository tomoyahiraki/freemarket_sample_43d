class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :kana_name, null: false
      t.integer :telphone_number, null: false, unique: true
      t.string :maol_number, null: false, unique: true
      t.string :password, null: false
      t.integer :birth, null: false
      t.integer :proceed
      t.string :provider
      t.string :uid
      t.timestamps
    end
  end
end
