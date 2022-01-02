class AccountsController < ApplicationController
  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      @account.users << current_user
      redirect_to [@account, :inboxes], notice: "Account created successfully."
    else
      render :new
    end
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
