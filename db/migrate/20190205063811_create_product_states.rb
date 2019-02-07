class CreateProductStates < ActiveRecord::Migration[5.0]
  def change
    create_table :product_states do |t|
      t.string :name
      t.timestamps
    end
  end
end
