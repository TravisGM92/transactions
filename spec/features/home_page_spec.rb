require 'rails_helper'

RSpec.describe 'Home page' do
  it 'Has a mobile friendly home page' do
    visit('/')
  end
end
