class CreatePictures < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :pictures do |t|
      t.uuid :url, default: 'gen_random_uuid()'
      t.references :book, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
