class CreateEpisodeRatings < ActiveRecord::Migration
  def change
    create_table :episode_ratings do |t|
      t.integer :tmdb_identifier
      t.integer :rating
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
