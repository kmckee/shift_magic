class Login
  include PageObject
 
  page_url("#{FigNewton.base_url}/login")

  text_field(:username, :id=>'username')
  text_field(:password, :id=>'password')

  button(:login, :value=>'Log In')
end
