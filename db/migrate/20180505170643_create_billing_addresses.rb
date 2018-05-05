class CreateBillingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :billing_addresses do |t|
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
  end
end
