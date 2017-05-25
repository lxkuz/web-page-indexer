# frozen_string_literal: true
require 'active_support/concern'
require 'uri'

module WebIndexer
  extend ActiveSupport::Concern

  included do
    before_save :fetch_content


    private

    def fetch_content

      response = Faraday.get URI(url).to_s 
      body = response.body
    end  



  end
end