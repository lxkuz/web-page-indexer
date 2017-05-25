require 'active_support/concern'
require 'uri'

module WebIndexer
  extend ActiveSupport::Concern
  
  included do
    before_save :fetch_content
    cattr_accessor :__watch_tags  

    def self.fetch_tags tags
      self.__watch_tags = tags
    end  

    private

    def fetch_content
      begin 
        html_string = Faraday.get(url).body
        doc = Nokogiri::HTML html_string
        res = {}
        self.class.__watch_tags.each do |tag_name|
          res[tag_name] = doc.xpath("//#{tag_name}").map(&:content)
        end
        self.content = res
      rescue Exception => e
        self.content = {error: e.to_s}
      end
    end  
  end
end
