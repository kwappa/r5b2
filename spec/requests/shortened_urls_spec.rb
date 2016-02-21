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

  describe 'POST /u' do
    subject(:post_url) { post shortened_urls_path, params: { shortened_url: { original_url: original_url } } }

    context 'when invalid url is given' do
      let(:original_url) { 'INVALID_URL_STRING' }
      it 'should raise bad request' do
        expect { post_url }.to raise_error ActionController::BadRequest
      end
    end

    context 'when valid url is given' do
      let(:original_url) { 'http://new.example.com' }
      it 'should return valid json' do
        post_url
        json = JSON.parse(response.body)
        expect(json['result']['shortened_url']['original_url']).to eq original_url
      end
    end
  end
end
