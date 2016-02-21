require "rails_helper"

RSpec.describe ShortenedUrlsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/u/foo').to route_to('shortened_urls#show', id: 'foo')
    end

    it 'routes to #create' do
      expect(post: '/u').to route_to('shortened_urls#create')
    end
  end
end
