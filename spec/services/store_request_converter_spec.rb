require 'rails_helper'

describe StoreRequestConverter do
  it '.declined' do
    request = create(:store_request)
    converter = StoreRequestConverter.new(request)
    declined = converter.declined
    expect(declined).to be true
  end

  it '.approved' do
    user = create(:user)
    request = create(:store_request, user: user)
    converter = StoreRequestConverter.new(request)
    approved = converter.approved
    expect(approved).to be true
  end
end
