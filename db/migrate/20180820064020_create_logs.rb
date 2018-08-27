class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
