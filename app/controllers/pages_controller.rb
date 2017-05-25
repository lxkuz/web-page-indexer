# frozen_string_literal: true
class PagesController < ApplicationController
  def create
    record = Page.new resource_params
    if record.save
      render json: record.to_json
    else
      render json: serialize_errors(record).to_json, status: 406
    end
  end

  def index
    render json: Page.all
  end

  private

  def resource_params
    params.permit(:url)
  end
end
