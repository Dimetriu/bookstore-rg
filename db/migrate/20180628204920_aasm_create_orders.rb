class AASMCreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table(:orders) do |t|
      t.decimal :total_price
      t.datetime :completed_date
      t.string :state

      t.timestamps null: false
    end
  end
end
