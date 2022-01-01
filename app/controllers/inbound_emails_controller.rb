class InboundEmailsController < ApplicationController
  def index
    @inboxes = Inbox.all
    @inbound_emails = EmailPresenter.wrap(inbox.inbound_emails.order(created_at: :desc))
  end

  def show
    @inboxes = Inbox.all
    @inbound_emails = EmailPresenter.wrap(inbox.inbound_emails)
    @inbound_email = EmailPresenter.new(inbox.inbound_emails.find(params[:id]))

    if params[:raw]
      respond_to do |format|
        format.html { render inline: @inbound_email.html_body }
        format.text { render inline: @inbound_email.text_body }
      end
    end
  end

  def destroy
    inbox.inbound_emails.find(params[:id]).destroy!

    redirect_to inbound_emails_path, notice: "Email incinerated"
  end

  private

  def inbox
    @inbox ||= Inbox.find(params[:inbox_id])
  end
end
