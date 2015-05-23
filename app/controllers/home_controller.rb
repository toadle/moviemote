class HomeController < ActionController::Base
  layout "application"

  protect_from_forgery with: :exception

  def index
  end
  
end
