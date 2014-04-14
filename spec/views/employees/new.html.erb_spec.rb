require 'spec_helper'

describe "employees/new" do
  before(:each) do
    assign(:employee, stub_model(Employee,
      :name => "MyString",
      :mobile_phone => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employees_path, "post" do
      assert_select "input#employee_name[name=?]", "employee[name]"
      assert_select "input#employee_mobile_phone[name=?]", "employee[mobile_phone]"
      assert_select "input#employee_email[name=?]", "employee[email]"
    end
  end
end
