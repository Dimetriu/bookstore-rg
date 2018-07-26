class CreateRatings < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :ratings do |t|
      t.text :text_review, null: false, default: ""
      t.integer :rating_number, null: false, default: 0
      t.string :rateable_type, index: { algorithm: :concurrently }
      t.integer :rateable_id, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
