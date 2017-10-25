require 'rails_helper'

describe 'Internal API' do
  context 'authorized user' do
    it 'can display JSON endpoint' do
      create_list(:store, 5)
      api_token = ApiKey.create!

      get "http://localhost:3000/api/v1/merchants", headers: { 'Authorization' => %{Token token="#{ENV['API_KEY']}"}}

      expect(response).to be_success

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(5)
    end
  end

  context 'unauthorized user' do
    it 'dispplays access denied' do
      stores = create_list(:store, 5)

      get "http://localhost:3000/api/v1/merchants"

      expect(response).to_not be_success
      expect(response).to_not render_template(:index)
    end
  end
end