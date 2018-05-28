class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
