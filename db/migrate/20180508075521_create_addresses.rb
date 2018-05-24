class CreateAddresses < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :addresses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true, index: { algorithm: :concurrently }
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
