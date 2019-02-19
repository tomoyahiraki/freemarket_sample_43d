class RemoveAuthorFromCategories < ActiveRecord::Migration[5.0]
  def up
    remove_column :categories, :children_id, :string
    remove_column :categories, :grandchildren_id, :string
      end

  def down
    add_column :categories, :children_id, :string
    add_column :categories, :grandchildren_id, :string
  end
end
