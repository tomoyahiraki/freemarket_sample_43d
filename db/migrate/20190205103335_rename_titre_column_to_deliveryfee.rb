class RenameTitreColumnToDeliveryfee < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :delivery_fee_id, :deliveryfee_id
    rename_column :products, :delivery_day_id, :deliveryday_id
  end
end
