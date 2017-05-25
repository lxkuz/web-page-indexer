# frozen_string_literal: true
class SwagController < ApplicationController
  def editor
    # open swagger editor with current swagger.yml url
    redirect_to SWAGGER_EDITOR_URL
  end

  def ui
    # open swagger UI with current swagger.yml url
    redirect_to SWAGGER_UI_URL
  end
end
