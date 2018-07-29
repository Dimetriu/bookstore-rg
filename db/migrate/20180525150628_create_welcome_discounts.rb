class CreateWelcomeDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :welcome_discounts do |t|
      t.string :number, null: false, default: ""
      t.decimal :value, null: false, default: 0.05
      t.datetime :used_at
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
