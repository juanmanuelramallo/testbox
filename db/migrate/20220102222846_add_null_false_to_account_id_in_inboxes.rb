class AddNullFalseToAccountIdInInboxes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :inboxes, :account_id, false
  end
end
