require "rails_helper"

RSpec.describe InboundEmailsController do
  describe "GET /inboxes/:inbox_id/inbound_emails/:id" do
    subject { get inbox_inbound_email_path(inbox, inbound_email, params: params, format: format), headers: basic_authorization_header }

    let(:inbox) { create(:inbox) }
    let(:inbound_email) { create(:action_mailbox_inbound_email) }

    before do
      inbox.inbound_emails << inbound_email
    end

    context "when raw email is requested" do
      let(:params) do
        {raw: true}
      end

      context "when html part is requested" do
        let(:format) { "html" }

        it "returns the HTML body" do
          subject
          expect(response.body).to include("What's the status?")
        end
      end

      context "when text part is requested" do
        let(:format) { "txt" }

        it "returns nothing" do
          subject
          expect(response.body).to be_empty
        end
      end
    end
  end
end
