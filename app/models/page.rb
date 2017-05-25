class Page < ApplicationRecord
  validates :url, presence: true
  
  WATCH_TAGS = [:h1, :h2, :h3, :a]

  include WebIndexer
  fetch_tags WATCH_TAGS
  
  WATCH_TAGS.each do |tag|
    define_method "#{tag}_tags" do
      content && content[tag.to_s]
    end
  end

  public
  
  def url= url
    write_attribute(:url, polish_url(url)) 
  end

  private

  def polish_url url
    return url if %r<^https?://>.match url
    "http://#{url}"
  end
end
