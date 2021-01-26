# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
