class ChangeDataTypeForInvitationsAccepted < ActiveRecord::Migration[5.1]
  def change
    change_column :invitations, :accepted, :string
  end
end
