class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true, index: true
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
