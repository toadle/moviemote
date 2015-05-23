module ApplicationHelper
  def add_to_watch_list_button(tmdb_identifier)
    render 'shared/add_to_watch_list', tmdb_identifier: tmdb_identifier
  end

  def current_user
    @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end
end
