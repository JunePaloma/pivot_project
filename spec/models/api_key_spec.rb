require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it 'returns a string od random hexidecimal' do
    key = ApiKey.create!
    expect(key.access_token).to match(/[0-9a-f]{32,}/)
  end
end
