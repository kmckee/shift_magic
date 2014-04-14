class EmployeeList
  include PageObject
  page_url("#{FigNewton.base_url}/employees")

  table(:employee_table, :id => 'employees')
  
  def employees
    employee_table_element.map { |row| [row[1].text, row[2].text, row[3].text] }[1..-1]
  end

  def delete name
    confirm(true) do
      get_row_for(name).link(:text => 'Delete').click
    end
  end

  private

  def get_row_for name
    employee_table_element.find { |row| row.text.include? name }
  end
end
