# frozen_string_literal: true
class Page < ApplicationRecord
  validates :url, presence: true
  paginates_per 10

  include WebIndexer

  def url=(url)
    write_attribute(:url, polish_url(url)) if url
  end

  private

  def polish_url(url)
    return url if %r{^https?://}.match? url
    "http://#{url}"
  end
end
