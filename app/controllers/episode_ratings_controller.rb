class EpisodeRatingsController < ApplicationController

  def create
    current_user.episode_ratings.create(episode_ratings_params)
  end

  def update
    rating = current_user.episode_ratings.find(params[:id])
    rating.update_attributes(episode_ratings_params)
  end



private 

  def episode_ratings_params
    params.require(:episode_rating).permit(:rating, :tmdb_identifier)
  end


end
