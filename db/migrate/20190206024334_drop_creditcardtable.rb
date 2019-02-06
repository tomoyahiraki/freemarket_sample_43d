class DropCreditcardtable < ActiveRecord::Migration[5.0]
  def change
    drop_table :creditcards
  end
end
