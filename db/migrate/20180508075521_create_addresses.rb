class CreateAddresses < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :addresses do |t|
      t.integer :kind, default: 0
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone

      t.string :addressable_type, index: { algorithm: :concurrently }
      t.integer :addressable_id, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
