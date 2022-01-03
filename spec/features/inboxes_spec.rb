require "rails_helper"

RSpec.describe "Inboxes", js: true do
  let(:account) { create(:account) }
  let(:user) { create(:user) }

  before do
    account.users << user
  end

  scenario "user creates a new inbox" do
    sign_in user
    visit root_path

    within "#empty_message" do
      fill_in "inbox[name]", with: "My new test inbox"
      click_on "Create Inbox"
    end

    expect(page).to have_text("My new test inbox")

    fill_in "inbox[name]", with: "My new test inbox"
    click_on "Create Inbox"

    expect(page).to have_text("Please upgrade your account. Max number of inboxes reached.")
  end

  scenario "user removes an inbox" do
    create(:inbox, name: "My test inbox", account: account)

    sign_in user
    visit root_path

    click_on "My test inbox"
    click_on "Remove"

    expect(page).not_to have_text("My test inbox")
  end
end
