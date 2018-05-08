class CreateAddresses < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :addresses do |t|
      t.belongs_to :user, foreign_key: true, index: { algorithm: :concurrently }
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.string :country, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
