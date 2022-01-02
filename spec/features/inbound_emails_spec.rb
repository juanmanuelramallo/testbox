require "rails_helper"

RSpec.describe "See an inbound email", js: true do
  let(:inbox) { create(:inbox, name: "My test inbox") }
  let(:inbox_2) { create(:inbox, name: "Other inbox") }
  let(:email) { create(:action_mailbox_inbound_email) }

  before do
    inbox_2
    inbox.inbound_emails << email
  end

  scenario "user opens an email from the beginning" do
    visit root_path

    click_on "My test inbox"
    click_on "Fwd: Status update?"
    expect(page).to have_text("Fwd: Status update?")
    expect(page).to have_text("rails@example.com")
    expect(page).to have_text("save@example.com")

    click_on "Other inbox"
    expect(page).not_to have_text("Fwd: Status update?")
    expect(page).to have_text("Send an email to your inbox's address to see it here.")
  end
end
