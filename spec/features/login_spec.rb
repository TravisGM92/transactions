require 'rails_helper'

RSpec.describe 'Login page' do
  describe 'has a form' do
    it 'has fields and a submit button' do
      visit('/login')
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_button('Login')
    end
  end
end
