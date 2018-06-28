class CreateOrderItems < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.references :order, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
