# frozen_string_literal: true
class IndexWebPageJob < ApplicationJob
  queue_as :default

  def perform(id)
    page = Page.find id
    puts "PERFORM!!! #{page}"
    page.fetch_content!
  end
end
