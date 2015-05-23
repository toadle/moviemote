class TvShowsController < ApplicationController

  before_action :load_tv_show

  def show
  end

  def search
    @results = Imdb::Search.new(tv_show_search_params[:query]).movies[0..9]
  end

private

  def load_tv_show
    @tv_show = Imdb::Serie.new(params[:id])
  end

  def tv_show_search_params
    params[:tv_show_search]
  end

end
