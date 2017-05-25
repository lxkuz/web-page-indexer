class ApplicationController < ActionController::API

  protected

  def serialize_errors(record)
    ErrorSerializer.new(record)
  end

end
