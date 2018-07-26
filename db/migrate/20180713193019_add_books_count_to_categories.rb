class AddBooksCountToCategories < ActiveRecord::Migration[5.2]
  def change
    change_table :categories do |t|
      t.integer :books_count, default: 0
    end

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
      UPDATE categories
        SET books_count = (SELECT count(1) FROM books WHERE books.category_id = categories.id)
    SQL
  end
end
