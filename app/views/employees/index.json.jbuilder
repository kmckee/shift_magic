json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :mobile_phone_number, :email
  json.url employee_url(employee, format: :json)
end
