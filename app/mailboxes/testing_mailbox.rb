class TestingMailbox < ApplicationMailbox
  def process
    Rails.logger.info "TestingMailbox#process"
    Rails.logger.info mail.inspect
  end
end
