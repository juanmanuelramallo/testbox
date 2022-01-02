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

class Inbox < ApplicationRecord
  attribute :identifier, :uuid, default: -> { SecureRandom.uuid }

  belongs_to :account

  validates :name, :identifier, presence: true
  validates :identifier, uniqueness: true
  validates :name, uniqueness: { scope_to: :account_id }

  has_many :inbox_emails, dependent: :destroy
  has_many :inbound_emails, through: :inbox_emails, dependent: :destroy

  def address
    "#{identifier}@#{ENV.fetch("INBOUND_DOMAIN", "")}"
  end
end
