class CreateBirthYears < ActiveRecord::Migration[5.0]
  def change
    create_table :birth_years do |t|
      t.integer :name
      t.timestamps
    end
  end
end
