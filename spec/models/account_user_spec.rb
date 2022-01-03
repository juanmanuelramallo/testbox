# == Schema Information
#
# Table name: account_users
#
#  id         :integer          not null, primary key
#  account_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_account_users_on_account_id  (account_id)
#  index_account_users_on_user_id     (user_id)
#

require "rails_helper"

RSpec.describe AccountUser, type: :model do
end
