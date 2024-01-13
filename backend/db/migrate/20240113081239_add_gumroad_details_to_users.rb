class AddGumroadDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :name, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :gumroad_user_id, :string
    add_column :users, :url, :string
  end
end
