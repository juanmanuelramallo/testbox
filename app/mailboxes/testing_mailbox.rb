class TestingMailbox < ApplicationMailbox
  def process
    identifier = mail.to.split("@").first
    inbox = Inbox.find_by(identifier: identifier)

    if inbox.present?
      inbox.inbound_emails << inbound_email
    else
      inbound_email.destroy!
      Rails.logger.info "No inbox found for #{identifier}"
    end
  end
end
