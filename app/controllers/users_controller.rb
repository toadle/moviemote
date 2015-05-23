class UsersController < ApplicationController

  before_action :load_watch_list

  def show
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to user_path(user) #, notice: "Signed in!"
  end

  def session_destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  protected

  def load_watch_list
    @watch_list = WatchListEntry.all.map { |entry| OpenStruct.new(Tmdb::TV.detail(entry.tmdb_identifier)) }
  end

end