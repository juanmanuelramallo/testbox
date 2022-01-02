# == Schema Information
#
# Table name: inboxes
#
#  id         :integer          not null, primary key
#  name       :string
#  identifier :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#
# Indexes
#
#  index_inboxes_on_account_id  (account_id)
#

FactoryBot.define do
  factory :inbox do
    account
    name { "My inbox" }
    identifier { SecureRandom.uuid }
  end
end
