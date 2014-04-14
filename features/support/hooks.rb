require 'watir-webdriver'

AfterConfiguration do
  @@browser = Watir::Browser.new :firefox
end

Before do
  @browser = @@browser
end

at_exit do
  @@browser.close
end

