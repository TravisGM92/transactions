# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page' do
  it 'Has a mobile friendly home page' do
    visit('/')

    expect(page).to have_content('Crunch the numbers')
    expect(page).to have_content('Upload transactions, receipts & more with your phone')
    expect(page).to have_content('Store it all, safely')
  end
end
