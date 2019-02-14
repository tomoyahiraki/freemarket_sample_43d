class ChangeBirthYearIdToUsertests < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :birth_year_id, :integer, null: true, foreign_key: true
  end
end
