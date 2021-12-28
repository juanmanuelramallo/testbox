class InboundEmailsController < ApplicationController
  def index
    @emails = ActionMailbox::InboundEmail.all
  end
end
