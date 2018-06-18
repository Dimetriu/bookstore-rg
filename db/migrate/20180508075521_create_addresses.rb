class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.integer :kind, default: 0
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone

      t.string :addressable_type
      t.integer :addressable_id, type: :uuid

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
