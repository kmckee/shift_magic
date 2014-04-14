class Login
  include PageObject
 
  page_url("#{FigNewton.base_url}/users/sign_in")

  text_field(:email, :id=>'user_email')
  text_field(:password, :id=>'user_password')

  button(:sign_in, :value=>'Sign in')
end
