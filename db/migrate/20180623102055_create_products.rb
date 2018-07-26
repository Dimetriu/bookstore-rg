class CreateProducts < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :authors do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.text :biography, null: false, default: ""

      t.timestamps
    end

    create_table :books do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.decimal :price, precision: 10, scale: 2, null: false, default: 0.0
      t.integer :quantity, null: false, default: ""
      t.datetime :year_of_publication, null: false, default: DateTime.current.strftime("%y")
      t.hstore :dimensions
      t.string :authors, array: true, index: { using: 'gin' }, null: false, default: []
      t.string :materials, array: true, index: { using: 'gin' }, null: false, default: []
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
