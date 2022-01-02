require "rails_helper"

RSpec.describe "Inboxes", js: true do
  let(:account) { create(:account) }
  let(:inbox) { create(:inbox, name: "My test inbox", account: account) }
  let(:email) { create(:action_mailbox_inbound_email) }
  let(:user) { create(:user) }

  before do
    account.users << user
    inbox.inbound_emails << email
  end

  scenario "user creates a new inbox" do
    sign_in user
    visit root_path

    fill_in "inbox[name]", with: "My new test inbox"
    click_on "Create Inbox"

    expect(page).to have_text("My new test inbox")

    fill_in "inbox[name]", with: "My new test inbox"
    click_on "Create Inbox"

    expect(page).to have_text("has already been taken")
  end

  scenario "user removes an inbox" do
    sign_in user
    visit root_path

    click_on "My test inbox"
    click_on "Remove"

    expect(page).not_to have_text("My test inbox")
  end
end
