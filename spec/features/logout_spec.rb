require 'rails_helper'

RSpec.describe 'Logout' do
  describe 'When the logout button is hit, the user is redirected to home page' do
    it 'where they see login and register buttons' do
      user = User.create!(first_name: "eDog", email: "elah@email.com", password: "password", last_name: 'Dudet')
      visit('/')
      expect(page).to have_button('Login')
      click_button('Login')
      expect(current_path).to eq('/login')
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button('Login')

      expect(current_path).to eq('/dashboard')
      expect(page).to have_button('Logout')
      click_button('Logout')
      expect(current_path).to eq('/')
      expect(page).to have_content('You have logged out')
      expect(page).to_not have_button('Logout')
      expect(page).to have_button('Login')
    end
  end
end
