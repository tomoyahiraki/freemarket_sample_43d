class AddDetailsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :children_id, :string

    add_column :categories, :grandchildren_id, :string

  end
end
