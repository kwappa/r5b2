require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  describe 'validate :original_url' do
    shared_examples 'accept valid url' do
      specify do
        shortened_url = described_class.new(original_url: url)
        expect(shortened_url).to be_valid
        expect(shortened_url.hashed_url).to be_present
      end
    end

    shared_examples 'reject invalid url' do
      specify { expect(described_class.new(original_url: url)).not_to be_valid }
    end

    context 'when empty original_url is given' do
      let(:url) { '' }
      include_examples 'reject invalid url'
    end

    context 'when invalid original_url is given' do
      let(:url) { 'INVALID_URL' }
      include_examples 'reject invalid url'
    end

    context 'when valid original_url is given' do
      let(:url) { 'http://valid-url.example.com' }
      include_examples 'accept valid url'
    end
  end
end
