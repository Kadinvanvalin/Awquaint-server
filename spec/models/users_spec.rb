require 'rails_helper'

describe 'User' do
  let(:user) {User.new(name: "Nicole", email: "nicole@nicole.com", password: "password")}

  it 'has a name' do
    expect(user.name).to eq "Nicole"
  end

  it 'has an email' do
    expect(user.email).to eq "nicole@nicole.com"
  end

  it 'has a password' do
    expect(user.password).to eq "password"
  end

end
