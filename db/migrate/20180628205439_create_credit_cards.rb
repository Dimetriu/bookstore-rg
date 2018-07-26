class CreateCreditCards < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    create_table :credit_cards do |t|
      t.string :number, null: false, default: ""
      t.datetime :expiration_month, null: false, default: DateTime.current.strftime("%m")
      t.datetime :expiration_year, null: false, default: DateTime.current.strftime("%y")
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.references :user, foreign_key: true, index: { algorithm: :concurrently }

      t.timestamps
    end
  end
end
