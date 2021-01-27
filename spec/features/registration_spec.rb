# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regsitration page' do
  describe 'registration form' do
    it 'has specific fields' do
      visit('/register')

      expect(page).to have_field('first_name')
      expect(page).to have_field('last_name')
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_button('Register')
      expect(page).to have_button('Go back home')
    end
    it 'after filling the registration form and hitting submit, user is redirected to dashboard' do
      visit('/register')

      fill_in :first_name, with: 'George'
      fill_in :last_name, with: 'Freddy'
      fill_in :email, with: '1234@email.com'
      fill_in :password, with: '1234'
      click_button('Register')
      expect(current_path).to eq('/dashboard')
    end
  end
end

RSpec.describe 'User not registered' do
  it 'cant visit dashboard page' do
    visit('/dashboard')
    expect(current_path).to eq('/')
  end

  it 'wont register a user with an email already in use' do
    user = User.create!({ email: '1234@email.com', first_name: 'George', last_name: 'Canary', password: '1234' })

    visit('/')
    expect(page).to have_button('Register here')
    click_button('Register here')

    fill_in :email, with: user.email
    fill_in :first_name, with: 'Dudes'
    fill_in :last_name, with: 'Noway'
    fill_in :password, with: 'thisone'
    click_button('Register')

    expect(current_path).to eq('/register')
    expect(page).to have_content('Sorry, please try again')
  end
end
