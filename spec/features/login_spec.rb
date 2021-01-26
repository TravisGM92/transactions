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
      user = User.create!({email: '1234@email.com', first_name: 'George', last_name: 'Canary', password: '1234'})
      visit('/login')
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button('Login')
      expect(current_path).to eq('/dashboard')
    end
  end
end
