# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Page indexing', type: :request do
  it 'correctly loads and parse content data' do
    url = 'http://web.com'
    post '/', params: { url: url }
    expect(response).to be_success
    get '/'
    expect(response).to be_success
    full_data = JSON.parse(response.body)
    obj = full_data.select { |page| page['url'] == url }[0]
    content = obj['content']
    expect(content['h1'].size).to be_eql(3)
    expect(content['h2'].size).to be_eql(2)
    expect(content['h3'].size).to be_eql(4)
    expect(content['h3'][1]).to be_eql('Testing h3 step 2')
    expect(content['a'].size).to be_eql(3)
    expect(content['a'][0]).to be_eql('Google')
  end

  it 'save errors to content data' do
    url = 'http://testing for bad uri!'
    post '/', params: { url: url }
    expect(response).to be_success
    get '/'
    expect(response).to be_success
    full_data = JSON.parse(response.body)
    obj = full_data.select { |page| page['url'] == url }[0]
    content = obj['content']
    expect(content['error']).to be_eql("bad URI(is not URI?): #{url}")
  end
end
