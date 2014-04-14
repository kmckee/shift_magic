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

When(/^I view the employee details for "(.*?)"$/) do |employee_name|
  employee_id = Employee.find_by_name(employee_name).id
  visit_page(EmployeeDetails, :using_params => { :id => employee_id })
end

Then(/^I should see the following employee details$/) do |employee|
  on_page(EmployeeDetails) do |page|
    expected_details = employee.symbolic_hashes.first
    page.name.should == expected_details[:name]
    page.mobile_phone_number.should == expected_details[:mobile_phone]
    page.email.should == expected_details[:email]
  end
end

When(/^I update the employee details for "(.*?)" to the following:$/) do |employee_name, updates_table|
  employee_id = Employee.find_by_name(employee_name).id
  visit_page(EmployeeEdit, :using_params => { :id => employee_id }) do |page|
    employee_updates = updates_table.symbolic_hashes.first
    page.name = employee_updates[:name]
    page.mobile_phone = employee_updates[:mobile_phone]
    page.email = employee_updates[:email]
    page.save
  end
end

When(/^I delete the employee named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
