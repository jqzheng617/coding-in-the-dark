class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.integer :author_id
      t.integer :book_id

      t.timestamps
    end
  end
end
