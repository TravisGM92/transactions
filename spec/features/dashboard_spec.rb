# frozen_string_literal: true

require 'rails_helper'

describe 'Dashboard page' do
  before(:each) do
    user = User.create!(first_name: 'eDog', email: 'elah@email.com', password: 'password', last_name: 'Dudet')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  it 'has a field to upload CSV data' do
    visit('/dashboard')
    expect(page).to have_button('Logout')
    expect(page).to have_button('Upload CSV file')
    expect(page).to have_button('Upload & Save CSV file')
  end
  it 'has a field showing all CSV files ever uploaded (if in saved area)' do
    visit('/dashboard')
    expect(page).to have_css('.not_saved')
  end
  it 'can successfully upload CSV file and not save it, but display it' do
    visit('/dashboard')
    within('.not_saved') do
      expect(page).to have_css('.file_1')
    end
  end
end
