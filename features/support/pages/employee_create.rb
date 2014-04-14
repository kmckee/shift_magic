class EmployeeCreate
  include PageObject
  page_url("#{FigNewton.base_url}/employees/new")
  
  text_field(:name, :id=> "employee_name")
  text_field(:mobile_phone, :id=> "employee_mobile_phone")
  text_field(:email, :id=> "employee_email")

  button(:create, :value=>'Create Employee')

  def create_employee hash
    self.name = hash[:name]
    self.mobile_phone = hash[:mobile_phone]
    self.email = hash[:email]
    create
  end
end
