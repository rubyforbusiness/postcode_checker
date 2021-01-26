# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing for app' do
  it 'routes as expected' do
    expect(get: '/postcodes/check').to route_to(
      controller: 'postcodes',
      action: 'check'
    )
  end
end
