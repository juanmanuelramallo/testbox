module CurrentAccount
  extend ActiveSupport::Concern

  included do
    helper_method :current_account
  end

  def current_account
    @current_account ||= current_user.accounts.find_by!(id: current_account_id)
  end

  private

  def current_account_id
    value = params[:account_id] ||
      cookies.permanent[:current_account_id] ||
      current_user.account_users.first&.account_id

    cookies.permanent[:current_account_id] = {
      value: value,
      httponly: true
    }

    value
  end
end
