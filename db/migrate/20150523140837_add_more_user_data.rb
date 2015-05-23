class AddMoreUserData < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :image, :string

    remove_column :users, :auth_hash
  end
end
