class InvitationsController < ApplicationController

  def create
    # params will be the current user id and the invitee id
    # search to see if the sender has any pending invites
      #if so return the invitation to the sender
    #otherwise, create a new pending invite in the system
    @inviter = User.find(params[:current_user_id].to_i)
    pending_invites = @inviter.received_invitations.where(accepted: "pending")
    if pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    else
      Invitation.create(sender_id: params[:current_user_id], receiver_id: params[:receiver_id].to_i, accepted: "pending")
      render json:{}, status: 201
    end
  end

  def check
    @user = User.find(params[:current_user_id])
    pending_invites = @user.received_invitations.where(accepted: "pending")
    accepted_invitations = @user.sent_invitations.where(accepted: "accepted")
    declined_invitations = @user.sent_invitations.where(accepted: "declined")
    if accepted_invitations.length > 0
      connection = accepted_invitations[0].receiver
      render json: {name: connection.name, interest: connection.interest}, status: 202
    elsif  pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    elsif declined_invitations.length > 0
      missed_connection = declined_invitations[0].receiver
      render json: {interest: missed_connection.interest}, status: 418
    else
      render json: {}, status: 304
    end
  end

end
