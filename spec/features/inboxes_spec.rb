require "rails_helper"

RSpec.describe "Inboxes", js: true do
  let(:inbox) { create(:inbox, name: "My test inbox") }
  let(:email) { create(:action_mailbox_inbound_email) }

  before do
    inbox.inbound_emails << email
  end

  scenario "user creates a new inbox" do
    visit root_path

    fill_in "inbox[name]", with: "My new test inbox"
    click_on "Create Inbox"

    expect(page).to have_text("My new test inbox")

    fill_in "inbox[name]", with: "My new test inbox"
    click_on "Create Inbox"

    expect(page).to have_text("has already been taken")
  end
end
