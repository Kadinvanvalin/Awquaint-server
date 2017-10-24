require 'rails_helper'

describe 'User' do
  let(:user) {User.create!(name: "Nicole", interest: "nothing", email: "nicole@nicole.com", password: "password", longitude: 87.45345, latitude: -77.234234)}
  let(:awquaintence) {User.create!(name: "Karl", interest: "Karling", email: "karl@karl.com", password: "password", longitude: 87.45345, latitude: -77.234235)}

  it 'has a name' do
    expect(user.name).to eq "Nicole"
  end

  it 'has an email' do
    expect(user.email).to eq "nicole@nicole.com"
  end

  it 'has a password' do
    expect(user.password).to eq "password"
  end

  it 'has an interest' do
    expect(user.interest).to eq "nothing"
  end

  it 'has a longitude' do
    expect(user.longitude).to eq 87.45345
  end

  it 'has a latitude' do
    expect(user.latitude).to eq -77.234234
  end

  it 'shows nearby users' do
    expect(awquaintence).to eq awquaintence
    expect(user.nearby.first).to eq awquaintence
  end

end
