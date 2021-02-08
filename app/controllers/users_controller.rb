# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      flash[:notice] = 'Sorry, please try again'
      redirect_to('/register')
    end
  end

  def show
    if current_user
      @user = current_user
      @file_data = create_file if params['file']
      @headers = CSV.read(params['file'].path, headers: true).headers if params['file']
    else
      redirect_to('/')
    end
  end

  def create_file
    FileToData.convert(params)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
