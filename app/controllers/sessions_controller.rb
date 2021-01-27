class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to('/dashboard')
    else
      flash[:error] = 'Sorry your credentials are bad, try again'
      redirect_to('/login')
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You have logged out'
    redirect_to('/')
  end
end
