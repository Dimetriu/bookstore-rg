class AddAttachmentsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :attachments, :json
  end
end
