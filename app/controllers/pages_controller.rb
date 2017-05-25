# frozen_string_literal: true
class PagesController < ApplicationController
  has_scope :page, default: 1

  def create
    record = Page.new resource_params
    if record.save
      render json: record
    else
      render json: serialize_errors(record).to_json, status: 406
    end
  end

  def index
    render json: apply_scopes(Page.order(created_at: :desc)).all
  end

  private

  def resource_params
    params.permit(:url)
  end
end
