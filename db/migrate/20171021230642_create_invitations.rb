class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer   :sender_id
      t.integer   :receiver_id
      t.boolean   :accepted

      t.timestamps
    end
  end
end
