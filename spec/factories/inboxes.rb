# == Schema Information
#
# Table name: inboxes
#
#  id         :integer          not null, primary key
#  name       :string
#  identifier :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :inbox do
    name { "My inbox" }
    identifier { SecureRandom.uuid }
  end
end
