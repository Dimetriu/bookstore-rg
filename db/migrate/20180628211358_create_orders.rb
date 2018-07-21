class CreateOrders < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.datetime :completed_date
      t.string :state
      t.references :user, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
