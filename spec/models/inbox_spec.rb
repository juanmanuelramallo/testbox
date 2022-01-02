# == Schema Information
#
# Table name: inboxes
#
#  id         :integer          not null, primary key
#  name       :string
#  identifier :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer          not null
#
# Indexes
#
#  index_inboxes_on_account_id  (account_id)
#

require "rails_helper"

RSpec.describe Inbox, type: :model do
end
