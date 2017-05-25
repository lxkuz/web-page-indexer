# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Page, type: :model do
  describe 'validations' do
    it 'should validate presence of URL' do
      should validate_presence_of(:url)
    end

    it 'should validate inclusion of content_status' do
      should validate_inclusion_of(:content_status).in_array(Page::CONTENT_STATUSES)
    end
  end

  describe 'polish url' do
    it 'should add http if url was set without this part' do
      url = 'test.com'
      page = Page.create url: url
      expect(page.reload.url).to be_eql("http://#{url}")
    end

    it 'should works correctly with http' do
      http_url = 'http://google.com'
      page = Page.create url: http_url
      expect(page.reload.url).to be_eql(http_url)
    end

    it 'should works correctly with https' do
      https_url = 'https://ya.ru'
      page = Page.create url: https_url
      expect(page.reload.url).to be_eql(https_url)
    end
  end
end
