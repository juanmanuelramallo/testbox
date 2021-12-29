class ApplicationController < ActionController::Base
  before_action :authenticate

  protected

  def authenticate
    http_basic_authenticate_or_request_with(name: "testbox", password: ENV.fetch("USER_PASSWORD"))
  end
end
