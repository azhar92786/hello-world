class AddIndexToBookCategories < ActiveRecord::Migration[5.2]
  def change
    add_index :books_categories, [:book_id, :category_id]
    add_index :books_categories, [:category_id, :book_id]
  end
end
