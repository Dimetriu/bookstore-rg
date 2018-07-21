class CreateCreditCards < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :credit_cards do |t|
      t.string :number
      t.datetime :expiration_month
      t.datetime :expiration_year
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
