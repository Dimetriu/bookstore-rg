class CreateWelcomeDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :welcome_discounts, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :number
      t.decimal :value, default: 0.05
      t.boolean :used, default: false
      t.references :user, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
