Given(/^the following employees have been created:$/) do |employees|
  employees.symbolic_hashes.each { |employee| FactoryGirl.create(:employee, employee) }
end

When(/^I view all of my employees$/) do
  visit_page(EmployeeList)
end

Then(/^I should see the following employees listed:$/) do |expected_employees|
  on_page(EmployeeList).employees.should =~ expected_employees.rows
end

