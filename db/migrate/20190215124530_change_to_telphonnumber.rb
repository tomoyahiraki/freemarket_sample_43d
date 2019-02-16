class ChangeToTelphonnumber < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :telphone_number, :string, default: ""
  end
end
