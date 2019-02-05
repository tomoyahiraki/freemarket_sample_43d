class CreateProductOlds < ActiveRecord::Migration[5.0]
  def change
    create_table :product_olds do |t|
      t.string :name
      t.timestamps
    end
  end
end
