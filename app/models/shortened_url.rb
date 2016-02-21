class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true, format: { with: URI::regexp }
end
