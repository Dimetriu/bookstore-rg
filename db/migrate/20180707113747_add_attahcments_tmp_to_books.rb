class AddAttahcmentsTmpToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :attachments_tmp, :json
  end
end
