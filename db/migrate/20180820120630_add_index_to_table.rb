class AddIndexToTable < ActiveRecord::Migration[5.2]
  def change
    add_index :books, :id
  end
end
