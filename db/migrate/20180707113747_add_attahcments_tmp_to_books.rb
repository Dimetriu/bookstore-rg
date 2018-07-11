class AddAttahcmentsTmpToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :images_tmp, :string, array: true, default: []
  end
end
