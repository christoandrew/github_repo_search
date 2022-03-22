require 'capybara/rspec'
require 'selenium-webdriver'
require 'rack/handler/puma'

Capybara.register_driver :chrome_headless do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome,
                                 options: Selenium::WebDriver::Chrome::Options.new(args: %w(headless no-sandbox disable-dev-shm-usage))
end

Capybara.default_driver = :rack_test
Capybara.default_max_wait_time = 7
Capybara.javascript_driver = :chrome_headless

Capybara.register_server :puma do |app, port, host|
  Rack::Handler::Puma.run(app, Port: port, Threads: "1:1", Silent: true)
end

Capybara.server = :puma
