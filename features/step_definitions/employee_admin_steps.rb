Given(/^the following employees have been created:$/) do |employees|
  employees.symbolic_hashes.each { |employee| FactoryGirl.create(:employee, employee) }
end

When(/^I view all of my employees$/) do
  visit_page(EmployeeList)
end

Then(/^I should see the following employees listed:$/) do |expected_employees|
  on_page(EmployeeList).employees.should =~ expected_employees.rows
end

When(/^I finish creating the following employee:$/) do |employee|
  visit_page(EmployeeCreate).create_employee(employee.symbolic_hashes.first)
end

When(/^I view the employee details for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the following employee details$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When(/^I update the employee details for "(.*?)" to the following:$/) do |arg1, table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When(/^I delete the employee named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
