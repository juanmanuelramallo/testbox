class InboundEmailsController < ApplicationController
  def index
    @emails = EmailPresenter.wrap(ActionMailbox::InboundEmail.all)
  end

  def show
    @email = EmailPresenter.new(ActionMailbox::InboundEmail.find(params[:id]))

    if params[:raw]
      respond_to do |format|
        format.html { render inline: @email.html_body }
        format.text { render inline: @email.text_body }
      end
    end
  end

  def destroy
    ActionMailbox::InboundEmail.find(params[:id]).destroy!

    redirect_to inbound_emails_path, notice: "Email incinerated"
  end
end
