class Page < ApplicationRecord
  validates :url, presence: true

  WATCH_TAGS = [:h1, :h2, :h3, :a]
  
  WATCH_TAGS.each do |tag|
    define_method "#{tag}_tags" do
      content && content[tag.to_s]
    end
  end

  
end
