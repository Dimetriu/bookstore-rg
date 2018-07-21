class CreateProducts < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.text :biography

      t.timestamps
    end

    create_table :books do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.date :year_of_publication
      t.hstore :dimensions
      t.string :authors, array: true, index: { using: 'gin' }
      t.string :materials, array: true, index: { using: 'gin' }
      t.belongs_to :category, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end

    create_table :authorships do |t|
      t.references :author, index: { algorithm: :concurrently }
      t.references :book, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
