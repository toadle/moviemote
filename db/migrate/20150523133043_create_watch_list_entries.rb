class CreateWatchListEntries < ActiveRecord::Migration
  def change
    create_table :watch_list_entries do |t|
      t.string      "imdb_identifier"
      t.integer     "user_id"
      t.timestamps null: false
    end
  end
end
