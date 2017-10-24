require 'rails_helper'

describe "user create route success", type: :request do

  before do
    User.destroy_all
    Invitation.destroy_all
    post '/users', params: {user: {name: "kadin", email: "kadin@email.com", password: "password"}}
  end

  it 'returns a success status' do
    expect(response).to have_http_status(:success)
  end

  it 'returns the user id' do
    user = User.find_by(email: "kadin@email.com")
    expect(JSON.parse(response.body)["id"]).to eq user.id
  end

  it 'returns the user id' do
    expect(JSON.parse(response.body)["interest"]).to eq "No interest provided"
  end
end

describe "user create route failure", type: :request do
  before do
    post '/users', params: {user: {name: "kadin", password: "password"}}
  end

  it 'returns an error status' do
    expect(response).to have_http_status(400)
  end
end
