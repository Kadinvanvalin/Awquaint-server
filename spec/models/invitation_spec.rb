require 'rails_helper'

RSpec.describe Invitation, type: :model do
  let(:user_1) {User.create(name: "Nicole", email: "nicole@nicole.com", password: "password")}
  let(:user_2) {User.create(name: "Kathiee", email: "kathiee@nicole.com", password: "password")}
  let(:invite) {Invitation.create(sender_id: user_1.id, receiver_id: user_2.id, accepted: "pending")}

  it 'has a sender' do
    expect(invite.sender).to be_an_instance_of User
  end

  it 'has an receiver' do
    expect(invite.sender).to be_an_instance_of User
  end

  it 'has an acceptance value' do
    expect(invite.accepted).to be_in(["pending", "accepted", "declined"])
  end

end
