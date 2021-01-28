# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page' do
  it 'Has a mobile friendly home page' do
    visit('/')

    expect(page).to have_content('Crunch the numbers')
    expect(page).to have_content('Upload transactions, receipts & more with your phone')
    expect(page).to have_content('Store it all, safely')
  end

  describe 'register button' do
    it 'allows a user to register' do
      visit '/'

      expect(page).to have_button('Register here')
      expect(page).to have_button('Login')
    end

    it 'redirects to register page upon clicking' do
      visit '/'
      click_button('Register here')
      expect(current_path).to eq('/register')
    end
  end
end

RSpec.describe 'Login/logout' do
  describe 'when clicked on' do
    it 'redirects to a login page' do
      visit('/')
      click_button('Login')
      expect(current_path).to eq('/login')
    end
  end

  it 'when a user is already logged in, login button doesnt show' do
    user = User.create!(first_name: 'eDog', email: 'elah@email.com', password: 'password', last_name: 'Dudet')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit('/')
    expect(page).to_not have_button('Register here')
    expect(page).to_not have_button('Login')
  end

  it 'when a user is already logged in, logout button shows' do
    user = User.create!(first_name: 'eDog', email: 'elah@email.com', password: 'password', last_name: 'Dudet')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit('/')
    expect(page).to have_button('Logout')
    expect(page).to have_button('Home')
    visit('/dashboard')
    expect(page).to have_button('Logout')
    expect(page).to have_button('Home')
    expect(page).to have_button('Dashboard')
  end
end
