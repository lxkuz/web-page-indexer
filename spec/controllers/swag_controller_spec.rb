# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SwagController, type: :controller do
  it 'should redirect to swagger editor' do
    get :editor
    expect(response).to redirect_to(SWAGGER_EDITOR_URL)
  end

  it 'should redirect to swagger UI' do
    get :ui
    expect(response).to redirect_to(SWAGGER_UI_URL)
  end
end
