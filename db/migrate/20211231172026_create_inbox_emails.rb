class CreateInboxEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :inbox_emails do |t|
      t.references :inbox, null: false, foreign_key: true
      t.references :inbound_email, null: false, foreign_key: { to_table: "action_mailbox_inbound_emails" }

      t.timestamps
    end
  end
end
