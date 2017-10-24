class InvitationsController < ApplicationController

  def create
    current_user_id = params[:current_user_id].to_i
    receiver_id = params[:receiver_id].to_i

    @inviter = User.find(current_user_id)
    pending_invites = @inviter.received_invitations.where(accepted: "pending")
    if pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    else
      Invitation.create(sender_id: current_user_id, receiver_id: receiver_id, accepted: "pending")
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
      render json: {name: connection.name, interest: connection.interest, image: connection.image.url, image_key: sender.image_file_name }, status: 202
    elsif  pending_invites.length > 0
      sender = pending_invites[0].sender
      render json: {pending_sender_id: sender.id, pending_sender_interest: sender.interest}, status: :ok
    elsif declined_invitations.length > 0
      missed_connection = declined_invitations[0].receiver
      declined_invitations[0].destroy
      render json: {interest: missed_connection.interest}, status: 418
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
       render json: {name: sender.name, interest: sender.interest, image: sender.image.url, image_key: sender.image_file_name}, status: 200
    else
      invite.accepted = "declined"
      invite.save
      render json: {}, status: 418
    end
  end

end
