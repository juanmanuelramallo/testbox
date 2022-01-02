# == Schema Information
#
# Table name: inbox_emails
#
#  id               :integer          not null, primary key
#  inbox_id         :integer          not null
#  inbound_email_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_inbox_emails_on_inbound_email_id  (inbound_email_id)
#  index_inbox_emails_on_inbox_id          (inbox_id)
#

FactoryBot.define do
  factory :inbox_email do
    inbox
    action_mailbox_inbound_email
  end
end
