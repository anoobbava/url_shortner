
require 'spec_helper'

RSpec.describe 'routes for Urls', type: :routing do
  it 'routes post create' do
    expect(post: '/url').to route_to(
      controller: 'urls',
      action: 'create'
    )
  end
end
