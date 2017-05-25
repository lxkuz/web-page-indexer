# frozen_string_literal: true
class SwagController < ApplicationController
  def editor
    # open swagger editor with current swagger.yml url
    redirect_to 'https://goo.gl/zHVJnH'
  end

  def ui
    # open swagger UI with current swagger.yml url
    redirect_to 'https://goo.gl/f61Q00'
  end
end
