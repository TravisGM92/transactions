# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login page' do
  describe 'has a form' do
    it 'has fields and a submit button' do
      visit('/login')
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_button('Login')
    end

    it 'when filled and submitted, redirects user to dashboard page' do
      user = User.create!({ email: '1234@email.com', first_name: 'George', last_name: 'Canary', password: '1234' })
      visit('/login')
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button('Login')
      expect(current_path).to eq('/dashboard')
    end
  end
end

RSpec.describe 'Login page' do
  describe 'if user logs in with bad credentials' do
    it 'user is redirected to login page with error message' do
      user = User.create!({ email: '1234@email.com', first_name: 'George', last_name: 'Canary', password: '1234' })
      visit('/login')

      fill_in :email, with: user.email
      fill_in :password, with: '1111'
      click_button('Login')
      expect(current_path).to_not eq('/dashboard')
      expect(current_path).to eq('/login')
      expect(page).to have_content('Sorry your credentials are bad, try again')
    end
  end
end
