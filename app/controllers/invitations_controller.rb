class InvitationsController < ApplicationController

  def create
    current_user_id = params[:current_user_id].to_i
    receiver_id = params[:receiver_id].to_i

    @inviter = User.find(current_user_id)
    pending_invites = @inviter.received_invitations.where(accepted: "pending")
    if pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {create:"already have an invite",pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    else
     Invitation.create(sender_id: current_user_id, receiver_id: receiver_id, accepted: "created new invite")
      render json:{create:"pending"}, status: 201
    end
  end

  def check
    @user = User.find(params[:current_user_id].to_i)
    pending_invites = @user.received_invitations.where(accepted: "pending")
    p pending_invites
    accepted_invitations = @user.sent_invitations.where(accepted: "accepted")
    p accepted_invitations
    declined_invitations = @user.sent_invitations.where(accepted: "declined")
    p declined_invitations
    if accepted_invitations.length > 0
      connection = accepted_invitations[0].receiver
      accepted_invitations[0].destroy
      render json: {check: "user accepted your invite",name: connection.name, interest: connection.interest}, status: 202
    elsif  pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {check: "user sent you a new request",pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    elsif declined_invitations.length > 0
      missed_connection = declined_invitations[0].receiver
      declined_invitations[0].destroy
      render json: {check: "user declined your request",interest: missed_connection.interest}, status: 418
    else
      render json: {}, status: 304
    end
  end

  def invitation_response
    invite = Invitation.find_by(sender_id: params[:sender_id].to_i, receiver_id: params[:current_user_id].to_i)
    if params[:response] == "accepted"
      sender = User.find(params[:sender_id].to_i)
      invite.accepted = "accepted"
      invite.save
      render json: {invitation_response: "you accepted the invite!", name: sender.name, interest: sender.interest}, status: 200
    else
      invite.accepted = "declined"
      invite.save
      render json: {invitation_response: "you declined the invite!",}, status: 418
    end
  end

end
