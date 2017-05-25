# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'POST create page' do
    it 'creates new page' do
      post :create, params: { url: 'test.com' }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'return errors without url' do
      post :create
      expect(response).not_to be_success
      expect(response).to have_http_status(406)
      expect(JSON.parse(response.body)).to be_eql('errors' => {
                                                    'url' => ["can't be blank"]
                                                  })
    end
  end

  describe 'GET index pages' do
    it 'renders the index template' do
      Page.destroy_all
      get :index
      expect(JSON.parse(response.body)).to be_eql([])
    end
  end
end
