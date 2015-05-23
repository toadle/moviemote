class EpisodesController < ApplicationController

  layout "users"
  
  def index
  end

  def show
    @episode = OpenStruct.new Tmdb::Episode.detail(params[:tv_show_id],params[:season_number],params[:episode_number])
    @genre = Tmdb::Genre.detail(params[:genre_id])
  end


  def load_episode
    @tv_show = OpenStruct.new Tmdb::TV.detail(params[:id])
    @tv_show.seasons = @tv_show.seasons.map { |season| OpenStruct.new season }

  end

end