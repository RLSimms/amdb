class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user.present? && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to '/sessions/new', :notice => "Nice try!"
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end
