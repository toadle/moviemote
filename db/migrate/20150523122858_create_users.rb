class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :auth_hash
      t.timestamps null: false
    end
  end
end
