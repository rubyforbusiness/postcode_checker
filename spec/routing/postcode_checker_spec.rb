# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing for app' do
  it 'get postcode/check routes as expected' do
    expect(get: '/postcodes/check').to route_to(
                                         controller: 'postcodes',
                                         action: 'check'
                                       )
  end
  it 'post postcode/check routes as expected' do
    expect(post: '/postcodes/check').to route_to(
      controller: 'postcodes',
      action: 'submit'
    )
  end
end
