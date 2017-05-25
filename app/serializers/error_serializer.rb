# frozen_string_literal: true
class ErrorSerializer < ActiveModel::Serializer
  attribute :errors do
    object.errors.messages
  end
end
