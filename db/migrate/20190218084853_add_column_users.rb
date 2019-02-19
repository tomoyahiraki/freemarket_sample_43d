class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :customer_id, :string
    add_column :users, :token_id, :string
  end
end
