class CreateImages < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :images do |t|
      t.uuid :url, default: 'gen_random_uuid()'
      t.string :imageable_type, index: { algorithm: :concurrently }
      t.integer :imageable_id, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
