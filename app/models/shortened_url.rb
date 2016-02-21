class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true, format: { with: URI::regexp }

  before_validation :dummy_hashed_url

  private

  def dummy_hashed_url
    self.hashed_url = Digest::SHA1.hexdigest(original_url) if hashed_url.blank?
  end
end
