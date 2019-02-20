class AddColumnToSize < ActiveRecord::Migration[5.0]
  def change
    add_column :sizes, :category_size_id, :string
  end
end
