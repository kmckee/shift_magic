class EmployeeList
  include PageObject
  page_url("#{FigNewton.base_url}/employees")

  table(:employee_table, :id => 'employees')
  
  def employees
    employee_table_element.map { |row| [row[1].text, row[2].text, row[3].text] }[1..-1]
  end
end
