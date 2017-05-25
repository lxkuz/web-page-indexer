# frozen_string_literal: true
class PageSerializer < ActiveModel::Serializer
  attributes :id, :url, :content
end
