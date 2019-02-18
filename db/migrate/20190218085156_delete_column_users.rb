class DeleteColumnUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :creditcard_id, :integer, null: false, foreign_key: true
  end
end
