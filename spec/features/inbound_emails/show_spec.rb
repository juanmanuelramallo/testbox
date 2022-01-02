require "rails_helper"

RSpec.describe "See an inbound email" do
  let(:inbox) { create(:inbox, name: "My test inbox") }
  let(:email) { create(:action_mailbox_inbound_email) }

  before do
    inbox.inbound_emails << email
  end

  scenario "user opens an email from the beginning" do
    visit root_path

    click_on "My test inbox"
    click_on "Fwd: Status update?"
    expect(page).to have_text("Fwd: Status update?")
    expect(page).to have_text("rails@example.com")
    expect(page).to have_text("save@example.com")
  end
end
