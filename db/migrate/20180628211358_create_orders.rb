class CreateOrders < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :orders do |t|
      t.decimal :subtotal_amount, precision: 10, scale: 2, null: false, default: 0.0
      t.decimal :total_amount, precision: 10, scale: 2, null: false, default: 0.0
      t.datetime :completed_at
      t.integer :state, default: 0
      t.references :user, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
