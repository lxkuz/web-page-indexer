# frozen_string_literal: true
require 'active_support/concern'
require 'uri'

module WebIndexer
  extend ActiveSupport::Concern

  included do
    after_commit :schedule_fetching, on: :create
    cattr_accessor :__watch_tags

    WATCH_TAGS = [:h1, :h2, :h3, :a].freeze

    CONTENT_WAITING = 'waiting'
    CONTENT_READY = 'ready'
    CONTENT_LOADING = 'loading'
    CONTENT_ERROR = 'error'

    CONTENT_STATUSES = [
      CONTENT_WAITING,
      CONTENT_READY,
      CONTENT_LOADING,
      CONTENT_ERROR
    ].freeze

    validates :content_status, inclusion: CONTENT_STATUSES

    def schedule_fetching
      IndexWebPageJob.perform_later id
    end

    def fetch_content!
      return if content_status != CONTENT_WAITING
      self.content_status = CONTENT_LOADING
      save
      begin
        html_string = Faraday.get(url).body
        doc = Nokogiri::HTML html_string
        res = {}
        WATCH_TAGS.each do |tag_name|
          res[tag_name] = doc.xpath("//#{tag_name}").map(&:content)
        end
        self.content = res
        self.content_status = CONTENT_LOADING
      rescue => e
        self.content_status = CONTENT_READY
        self.content = { error: e.to_s }
      end
      save
    end
  end
end
