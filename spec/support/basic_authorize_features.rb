RSpec.configure do |config|
  config.before(:each, type: :feature) do
    username = "testbox"
    password = ENV.fetch("USER_PASSWORD")

    if page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(username, password)
    else
      host = Capybara.current_session.server.host
      port = Capybara.current_session.server.port
      visit "http://#{username}:#{password}@#{host}:#{port}/"
    end
  end
end
