class EpisodeHeartBeatsController < ApplicationController

  def create
    EpisodeHeartBeat.where(user_id: current_user.id, tmdb_identifier: episode_heart_beat_params[:tmdb_identifier]).first_or_create    
  end

private 

  def episode_heart_beat_params
    params.require(:episode_heart_beat).permit(:tmdb_identifier)
  end

end
