class AccountsController < ApplicationController
  before_action :check_user_accounts

  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      @account.users << current_user
      inbox = @account.inboxes.create!(name: "My test inbox")
      redirect_to [@account, inbox, :inbound_emails], notice: "Account created successfully."
    else
      render :new
    end
  end

  private

  def check_user_accounts
    return if current_user.accounts.empty?
    redirect_to [current_account, current_account.inboxes.first, :inbound_emails], notice: "You already have an account"
  end

  def account_params
    params.require(:account).permit(:name)
  end
end
