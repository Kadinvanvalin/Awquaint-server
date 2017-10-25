require 'rails_helper'

describe "invitation creation route", type: :request do
  load "#{Rails.root}/db/seeds.rb"

  before do
    post '/invitations', params: { current_user_id: User.find_by(name: "nicole").id, receiver_id: User.find_by(name: "kadin").id}
  end

  it 'returns a success status' do
    expect(response).to have_http_status(201)
  end

end

describe "invitation pending in creation route", type: :request do
 before do
    post '/invitations', params: { current_user_id: User.find_by(name: "kadin").id, receiver_id: User.find_by(name: "kara").id}
  end

  it 'returns a success status' do
    expect(response).to have_http_status(200)
  end

end

describe "check for invitations route - pending request", type: :request do
 before do
    post '/invitations/check', params: { current_user_id: User.find_by(name: "kadin").id}
  end

  it 'returns a success status' do
    expect(response).to have_http_status(200)
  end

end

describe "check for invitations route - accepted request", type: :request do
 before do
    post '/invitations/check', params: { current_user_id: User.find_by(name: "kathiee").id}
  end

  it 'returns an accepted status' do
    expect(response).to have_http_status(202)
  end

end

describe "check for invitations route - declined request", type: :request do
 before do
    post '/invitations/check', params: { current_user_id: User.find_by(name: "karl").id}
  end

  it 'returns an I am a teapot satus' do
    expect(response).to have_http_status(418)
  end

end

describe "check for invitations route - no updates", type: :request do
 before do
    post '/invitations/check', params: { current_user_id: User.find_by(name: "nicole").id}
  end

  it 'return a not modified status' do
    expect(response).to have_http_status(304)
  end

end

describe "invitation response route - accepted response", type: :request  do
   before do
    post '/invitations/response', params: { current_user_id: User.find_by(name: "kadin").id, sender_id: User.find_by(name: "kara").id, response: "accepted"}
  end

  it 'return a success status' do
    expect(response).to have_http_status(200)
  end

end

describe "invitation response route - accepted response", type: :request  do
   before do
    post '/invitations/response', params: { current_user_id: User.find_by(name: "kadin").id, sender_id: User.find_by(name: "kara").id, response: "declined"}
  end

  it 'return an I am a teapot status' do
    expect(response).to have_http_status(418)
  end

end
