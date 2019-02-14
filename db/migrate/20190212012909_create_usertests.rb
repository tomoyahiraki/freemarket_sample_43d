class CreateUsertests < ActiveRecord::Migration[5.0]
  def change
    create_table :usertests do |t|

      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :nickname, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :kana_first_name, null: false
      t.string :kana_last_name, null: false
      t.string :telphone_number, null: false, unique: true
      t.integer :birth_year_id, null: false, foreign_key: true
      t.integer :birth_month_id, null: false, foreign_key: true
      t.integer :birth_day_id, null: false, foreign_key: true
      t.integer :creditcard_id, null: false, foreign_key: true
      t.integer :proceed
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
