class ChangeDatatypeTelphoneNumberOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :telphone_number, :string, null: false, unique: true
  end
end
