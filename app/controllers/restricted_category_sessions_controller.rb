class RestrictedCategorySessionsController < ApplicationController
  def new; end

  def create
    if authorized?
      session[:restricted_categories] = true
      redirect_to songs_path
    else
      session[:restricted_categories] = false
      flash[:error] = 'Invalid credentials.'
      render :new
    end
  end

  private
  def auth_params
    params.require(:restricted_category_session).permit(:username, :password)
  end

  def authorized?
    auth_params[:username] == username && auth_params[:password] == password
  end

  def username
    @username ||= ENV['restricted_category_username']
  end

  def password
    @password ||= ENV['restricted_category_password']
  end
end