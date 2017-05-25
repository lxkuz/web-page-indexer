# frozen_string_literal: true
require 'active_support/concern'
require 'uri'

module WebIndexer
  extend ActiveSupport::Concern

  included do
    before_save :fetch_content
    cattr_accessor :__watch_tags

    WATCH_TAGS = [:h1, :h2, :h3, :a].freeze

    private

    def fetch_content
      html_string = Faraday.get(url).body
      doc = Nokogiri::HTML html_string
      res = {}
      WATCH_TAGS.each do |tag_name|
        res[tag_name] = doc.xpath("//#{tag_name}").map(&:content)
      end
      self.content = res
    rescue => e
      self.content = { error: e.to_s }
    end
  end
end
