class CreateAddresses < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :addresses do |t|
      t.integer :kind, default: 0
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :zip, null: false, default: ""
      t.string :country, null: false, default: ""
      t.string :phone, null: false, default: ""

      t.string :addressable_type, index: { algorithm: :concurrently }
      t.integer :addressable_id, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
