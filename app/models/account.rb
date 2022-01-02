# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :inboxes, dependent: :destroy
  has_many :account_users, dependent: :destroy
  has_many :users, through: :account_users
end
