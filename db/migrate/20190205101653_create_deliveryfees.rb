class CreateDeliveryfees < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveryfees do |t|
      t.string :name
      t.timestamps
    end
  end
end
