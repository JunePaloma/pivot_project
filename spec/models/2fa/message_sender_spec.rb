require 'rails_helper'

describe MessageSender do
  xit '.send_code' do
    phone = ENV['TEST_NUMBER']
    code = '123456'

    code_send = MessageSender.send_code(phone, code)

    expect(code_send).to be true
  end
end
