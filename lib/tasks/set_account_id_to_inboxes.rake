task set_account_id_to_inboxes: :environment do
  Rails.logger = Logger.new($stdout)
  Rails.logger.info "#{Inbox.where(account_id: nil).count} orphan inboxes"
  Inbox.all.update_all(account_id: Account.first.id)
  Rails.logger.info "#{Inbox.where(account_id: nil).count} orphan inboxes"
end
