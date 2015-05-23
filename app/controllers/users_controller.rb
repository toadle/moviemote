class UsersController < ApplicationController

  before_action :load_watch_list

  def create
    @user = User.find_or_create_by(auth_hash: auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  def show
  end

  protected

  def load_watch_list
    @watch_list = WatchListEntry.all.map { |entry| OpenStruct.new(Tmdb::TV.detail(entry.imdb_identifier)) }
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end