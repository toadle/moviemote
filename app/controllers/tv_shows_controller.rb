class TvShowsController < ApplicationController

  before_action :load_tv_show, except: [:search]

  def show
    all_episodes = @tv_show.seasons.map {|s| s.episodes }.flatten
    all_rating_not_zero = all_episodes.map { |e| e.rating.rating }.compact
    @average = (all_rating_not_zero.reduce(:+).to_f / all_rating_not_zero.size).round(2)
  end

  def search
    @search = Tmdb::Search.new
    @search.resource 'tv'
    @search.query tv_show_search_params[:query]
    @results = @search.fetch.map { |result| OpenStruct.new(result) }[0..9]
  end

private

  def load_tv_show
    @tv_show = OpenStruct.new Tmdb::TV.detail(params[:id])

    @tv_show.seasons = @tv_show.seasons.map { |season| OpenStruct.new season }
    @tv_show.seasons.each do |s|
      s.episodes = Tmdb::Season.detail(params[:id], s.season_number)["episodes"].map do |e| 
        return unless e.present?
        os = OpenStruct.new e
        if current_user
          os.rating = current_user.episode_ratings.where(tmdb_identifier: os.id).first
          os.rating = EpisodeRating.new(tmdb_identifier: os.id) unless os.rating
        end
        os
      end
    end
  end

  def tv_show_search_params
    params[:tv_show_search]
  end

end
