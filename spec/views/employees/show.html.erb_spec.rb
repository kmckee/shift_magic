require 'spec_helper'

describe "employees/show" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :name => "Name",
      :mobile_phone => "Mobile Phone",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Mobile Phone/)
    rendered.should match(/Email/)
  end
end
