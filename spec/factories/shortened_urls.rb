FactoryGirl.define do
  factory :shortened_url do
    hashed_url   'foo'
    original_url 'http://example.com'
    clicked_count 0
  end
end
