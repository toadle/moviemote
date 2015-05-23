class ChangeColumnNameWatchList < ActiveRecord::Migration
  def change
    rename_column :watch_list_entries, :imdb_identifier, :tmdb_identifier
  end
end
