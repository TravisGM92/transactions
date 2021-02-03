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
  end
end
