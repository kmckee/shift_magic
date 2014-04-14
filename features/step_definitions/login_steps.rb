Given(/^I am logged in as an admin$/) do
  User.create!(:email => 'admin@example.com', :password => 'password1234', :password_confirmation => 'password1234')
  visit_page(Login) do |page|
    page.email = 'admin@example.com'
    page.password = 'password1234'
    page.sign_in
  end
end

Given(/^I am at the login page$/) do
  visit_page(Login)
end

When(/^I log in as a valid user$/) do
  on_page(Login) do |page|
    User.create!({:email => 'admin@example.com', :password => "password1234", :password_confirmation => "password1234"})
    page.email = 'admin@example.com'
    page.password = 'password1234'
    page.sign_in
  end
end

Then(/^I should be on the Employee Listing page$/) do
  @browser.text.should include "Employees"
end

When(/^I attempt to log in with invalid user credentials$/) do
  on_page(Login) do |page|
    page.email = 'noone@example.com'
    page.password = 'notrealpassword1234'
    page.sign_in
  end
end

Then(/^I should be at the login page$/) do
  @browser.text.should include "Forgot your password?"
end

Then(/^I should see a message "(.*?)"$/) do |expected_message|
  @browser.text.should include expected_message
end
