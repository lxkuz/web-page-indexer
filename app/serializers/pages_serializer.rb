class PagesSerializer < ActiveModel::Serializer
  attributes :id, :url, :h1, :h2, :h3, :links, :content
end
