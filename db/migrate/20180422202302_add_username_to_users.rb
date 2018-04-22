class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        add_column :users, :username, :string
      end

      dir.down do
        remove_column :username
      end
    end
  end
end
