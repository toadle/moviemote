class CreateEpisodeHeartBeats < ActiveRecord::Migration
  def change
    create_table :episode_heart_beats do |t|
      t.integer :tmdb_identifier
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
