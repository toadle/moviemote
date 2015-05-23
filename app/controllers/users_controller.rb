class UsersController < ApplicationController
  def create
    @user = User.find_or_create_by(auth_hash: auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end