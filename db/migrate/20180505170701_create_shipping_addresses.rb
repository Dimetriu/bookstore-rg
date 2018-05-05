class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :shipping_addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.string :country, null: false
      t.string :phone, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :shipping_addresses, :first_name, unique: true, algorithm: :concurrently
    add_index :shipping_addresses, :last_name, unique: true, algorithm: :concurrently
  end
end
