class InboundEmailsController < ApplicationController
  def index
    @emails = ActionMailbox::InboundEmail.all
  end

  def show
    @email = EmailPresenter.new(ActionMailbox::InboundEmail.find(params[:id]))

    if params[:raw]
      respond_to do |format|
        format.html { render inline: @email.html_body&.decoded }
        format.text { render inline: @email.text_body&.decoded }
      end
    end
  end
end
