class InboxesController < ApplicationController
  def index
    @inboxes = Inbox.all
  end

  def show
    @inboxes = Inbox.all
    @inbox = Inbox.find(params[:id])
    @inbound_emails = EmailPresenter.wrap(@inbox.inbound_emails)
  end
end
