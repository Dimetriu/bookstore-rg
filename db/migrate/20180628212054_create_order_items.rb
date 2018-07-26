class CreateOrderItems < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false, default: 1
      t.decimal :unit_price, precision: 10, scale: 2, null: false, default: 0.0
      t.decimal :total_price, precision: 10, scale: 2, null: false, default: 0.0
      t.references :order, foreign_key: true, index: { algorithm: :concurrently }
      t.references :book, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
