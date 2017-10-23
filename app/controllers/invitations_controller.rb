class InvitationsController < ApplicationController

  def create
    @inviter = User.find(params[:current_user_id].to_i)
    pending_invites = @inviter.received_invitations.where(accepted: "pending")
    if pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {create:"pending_invites", pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    else
      Invitation.create(create:"no pending"sender_id: params[:current_user_id], receiver_id: params[:receiver_id].to_i, accepted: "pending")
      render json:{}, status: 201
    end
  end

  def check
    @user = User.find(params[:current_user_id].to_i)
    pending_invites = @user.received_invitations.where(accepted: "pending")
    accepted_invitations = @user.sent_invitations.where(accepted: "accepted")
    declined_invitations = @user.sent_invitations.where(accepted: "declined")
    if accepted_invitations.length > 0
      connection = accepted_invitations[0].receiver
      accepted_invitations[0].destroy
      render json: {check:"accept",name: connection.name, interest: connection.interest}, status: 202
    elsif  pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {check:"pending/ new invite"pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    elsif declined_invitations.length > 0
      missed_connection = declined_invitations[0].receiver
      declined_invitations[0].destroy
      render json: {check:"declined",interest: missed_connection.interest}, status: 418
    else
      render json: {check:"nothing new to show"}, status: 304
    end
  end



end
