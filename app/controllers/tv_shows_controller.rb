class TvShowsController < ApplicationController

  before_action :load_tv_show

  def show
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
      s.episodes = Tmdb::Season.detail(params[:id], s.season_number)["episodes"].map {|e| OpenStruct.new e }
    end
  end

  def tv_show_search_params
    params[:tv_show_search]
  end

end
