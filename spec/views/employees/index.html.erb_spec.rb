require 'spec_helper'

describe "employees/index" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :name => "Name",
        :mobile_phone => "Mobile Phone",
        :email => "Email"
      ),
      stub_model(Employee,
        :name => "Name",
        :mobile_phone => "Mobile Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
