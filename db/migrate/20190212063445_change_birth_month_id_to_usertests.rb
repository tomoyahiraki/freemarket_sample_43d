class ChangeBirthMonthIdToUsertests < ActiveRecord::Migration[5.0]

  def change
    change_column :users, :birth_month_id, :integer, null: true, foreign_key: true
  end

end
