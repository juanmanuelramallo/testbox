class AddAccountIdToInboxes < ActiveRecord::Migration[7.0]
  def change
    add_reference :inboxes, :account, null: true, foreign_key: true
  end
end
