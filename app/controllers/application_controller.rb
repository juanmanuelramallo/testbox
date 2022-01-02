class ApplicationController < ActionController::Base
  include CurrentAccount

  before_action :authenticate_user!
  before_action :check_account_exists!

  private

  def check_account_exists!
    return unless user_signed_in?
    return unless current_user.accounts.blank?
    return if controller_name == "accounts" || devise_controller?

    redirect_to new_account_path, notice: "Create your account to start using Testbox"
  end
end
