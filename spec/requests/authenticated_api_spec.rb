require 'rails_helper'

describe 'Internal API' do
  context 'authorized user'
    it 'can display JSON endpoint' do
      create_list = (:store, 5)

      get '/api/v1/merchants'

      expect(response).to be_success

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(5)
    end
end
