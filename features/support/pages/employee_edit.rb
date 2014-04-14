class EmployeeEdit
  include PageObject

  page_url("#{FigNewton.base_url}/employees/<%=params[:id]%>/edit")
  
  text_field(:name, :id=> "employee_name")
  text_field(:mobile_phone, :id=> "employee_mobile_phone")
  text_field(:email, :id=> "employee_email")
  
  button(:save, :value=>'Update Employee')
end
