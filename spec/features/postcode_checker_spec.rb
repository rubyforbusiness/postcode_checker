# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Postcode Checking end-to-end' do
  scenario 'User enters an invalid postcode' do
    visit '/postcodes/check'

    fill_in 'Postcode', with: 'rubbish'
    click_button 'Check postcode'

    expect(page).to have_text('Sorry that postcode is invalid')
  end
end
