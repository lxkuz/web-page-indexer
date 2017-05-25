# frozen_string_literal: true
class PageSerializer < ActiveModel::Serializer
  attributes :id, :content_status, :url, :content
end
