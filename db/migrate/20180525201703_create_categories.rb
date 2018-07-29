class CreateCategories < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :categories do |t|
      t.string :name, null: false, default: "", index: { unique: true, algorithm: :concurrently }, null: false

      t.timestamps
    end
  end
end
