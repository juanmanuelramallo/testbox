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

class Inbox < ApplicationRecord
  attribute :identifier, :uuid, default: -> { SecureRandom.uuid }

  validates :name, :identifier, presence: true
  validates :name, :identifier, uniqueness: true

  has_many :inbox_emails, dependent: :destroy
  has_many :inbound_emails, through: :inbox_emails, dependent: :destroy

  def address
    "#{identifier}@#{ENV.fetch("INBOUND_DOMAIN", "")}"
  end
end
