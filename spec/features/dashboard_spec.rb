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
end

describe 'Dashboard page' do
  before(:each) do
    user = User.create!(first_name: 'eDog', email: 'elah@email.com', password: 'password', last_name: 'Dudet')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  it 'can successfully upload CSV file and not save it, but display it' do
    visit('/dashboard')
    file_path = '/Users/travisgm/Desktop/us-500.csv'
    within('.file-no-save') do
      find('form input[type="file"]').set(file_path)
    end
    within('.file-no-save') do
      click_button('Upload')
    end
    columns = %w[first_name last_name address city county state zip phone1 phone2 email web]
    columns.each do |col|
      expect(page).to have_content(col)
    end
  end
end
