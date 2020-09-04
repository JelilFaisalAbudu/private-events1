class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :attendee_id
      t.integer :created_event_id

      t.timestamps
    end

    add_index :invitations, :attendee_id
    add_index :invitations, :created_event_id
    add_index :invitations, [:attendee_id, :created_event_id]
  end
end
