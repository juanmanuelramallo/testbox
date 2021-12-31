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
  validates :name, :identifier, presence: true

  has_many :inbox_emails
  has_many :inbound_emails, through: :inbox_emails

  def address
    "#{identifier}@#{ENV.fetch("INBOUND_DOMAIN", "")}"
  end
end
