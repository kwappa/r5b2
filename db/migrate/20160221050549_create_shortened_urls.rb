class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.string  :hashed_url,    null: false
      t.string  :original_url,  null: false
      t.integer :clicked_count, null: false, default: 0

      t.timestamps              null: false
    end

    add_index :shortened_urls, :hashed_url, unique: true
  end
end
