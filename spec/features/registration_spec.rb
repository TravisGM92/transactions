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
