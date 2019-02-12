class ChangeCreditcardIdToUsertests < ActiveRecord::Migration[5.0]

  def change
    change_column :users, :creditcard_id, :integer, null: true, foreign_key: true
  end
end
