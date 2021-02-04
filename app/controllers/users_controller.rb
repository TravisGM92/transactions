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
      @file_data = create_file
      @headers = CSV.read(params['file'].path, headers: true).headers
    else
      redirect_to('/')
    end
  end

  def create_file
    @data = FileToData.convert(params)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
