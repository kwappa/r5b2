require 'rails_helper'

RSpec.describe 'ShortenedUrls', type: :request do
  describe 'GET /u/:id' do
    context 'when shortened_url is found' do
      let!(:shortened_url) { create :shortened_url }

      it 'should redirect to original url' do
        get shortened_url_path('foo')
        expect(response).to redirect_to shortened_url.original_url
      end
    end

    context 'when shortened_url is not found' do
      it 'should raise 404' do
        expect { get shortened_url_path('not_found_url') }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
