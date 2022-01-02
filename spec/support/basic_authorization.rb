module BasicAuthorization
  def basic_authorization_header
    {
      HTTP_AUTHORIZATION:
        ActionController::HttpAuthentication::Basic.encode_credentials(
          "testbox",
          ENV.fetch("USER_PASSWORD")
        )
    }
  end
end
