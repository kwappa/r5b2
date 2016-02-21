require 'rails_helper'

RSpec.describe 'ShortenedUrls', type: :request do
  describe 'GET /shortened_urls/:id' do
    before { create :shortened_url }
    it 'works! (now write some real specs)' do
      get shortened_url_path('foo')
      expect(response).to have_http_status(200)
    end
  end
end
