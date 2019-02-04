class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, foreign_key: true
      t.integer :parent_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
