require 'rails_helper'

describe CodeGenerator do
  it '.generate' do
    code = CodeGenerator.generate

    expect(code.length).to eq 6
    expect(code.class).to eq String
    expect(code.to_i).to be_between(100000, 999999)
  end
end
