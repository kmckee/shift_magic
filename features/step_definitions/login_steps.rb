Given(/^I am at the login page$/) do
  visit_page(Login)
end

When(/^I log in as a valid user$/) do
  on_page(Login) do |page|
    User.create({:username => 'fred', :password => "1234"})
    page.username = 'fred'
    page.password = '1234'
    page.login
  end
end

Then(/^I should be on the Employee Listing page$/) do
  @browser.text.should include "Employees"
end
