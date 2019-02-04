class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :brand_name, foreign_key: true
      t.timestamps
    end
  end
end
