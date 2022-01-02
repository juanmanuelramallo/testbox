FactoryBot.define do
  factory :action_mailbox_inbound_email, class: "ActionMailbox::InboundEmail" do
    status { 0 }
    message_id { "a-message-id@example.com" }
    message_checksum { "a-message-checksum" }
    raw_email { Rack::Test::UploadedFile.new("spec/fixtures/email_source_1.eml", "message/rfc822") }
  end
end
