# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Postcode Checking end-to-end' do
  let(:valid_postcode) { 'SE1 7QD'}

  scenario 'User enters an invalid postcode' do
    visit '/postcodes/check'

    fill_in 'Postcode', with: 'rubbish'
    click_button 'Check postcode'

    expect(page).to have_text('Sorry that postcode is invalid')
  end

  scenario 'User enters a valid postcode which is serveable' do
    visit '/postcodes/check'

    fill_in 'Postcode', with: valid_postcode
    click_button 'Check postcode'

    expect(page).to have_text("Good news. #{valid_postcode} is in our service area")
  end
end
