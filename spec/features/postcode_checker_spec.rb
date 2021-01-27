# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Postcode Checking end-to-end' do
  let(:valid_postcode) { 'SE1 7QD' }
  let(:valid_unservable_postcode) { 'SW11 0DU' }
  let(:invalid_postcode) { 'rubbish' }

  scenario 'User enters an invalid postcode' do
    visit '/postcodes/check'

    fill_in 'Postcode', with: invalid_postcode
    click_button 'Check postcode'

    expect(page).to have_text("Sorry #{invalid_postcode} " \
                              'is an invalid postcode')
  end

  scenario 'User enters a valid postcode which is serveable' do
    visit '/postcodes/check'

    fill_in 'Postcode', with: valid_postcode
    click_button 'Check postcode'

    expect(page).to have_text("Good news. #{valid_postcode} " \
                              'is in our service area')
  end

  scenario 'User enters a valid postcode which is not serveable' do
    visit '/postcodes/check'

    fill_in 'Postcode', with: valid_unservable_postcode
    click_button 'Check postcode'

    expect(page).to have_text("Sorry #{valid_unservable_postcode} " \
                              'is not in our service area')
  end
end
