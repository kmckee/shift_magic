class EmployeeDetails
  include PageObject
  page_url("#{FigNewton.base_url}/employees/<%=params[:id]%>")

  span(:name, :id=>'employee_name')
  span(:mobile_phone_number, :id=>'employee_mobile_phone')
  span(:email, :id=>'employee_email')
end
