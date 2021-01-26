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
