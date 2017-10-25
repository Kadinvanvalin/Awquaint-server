require 'rails_helper'

describe "user successful login", type: :request do
  before do
    post '/sessions', params: {email: "kadin@email.com", password: "password"}
  end

  it 'returns a success status' do
    expect(response).to have_http_status(:success)
  end

end

describe "user failed login", type: :request do
  before do
    post '/sessions', params: {email: "kadin@email.com", password: "kadin"}
  end

  it 'returns an error response' do
    expect(response).to have_http_status(400)
  end

end
