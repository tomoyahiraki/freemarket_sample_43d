class ChangeBirthDayIdToUsertests < ActiveRecord::Migration[5.0]

  def change
    change_column :users, :birth_day_id, :integer, null: true, foreign_key: true
  end
end
