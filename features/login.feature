Feature: Login
  In order to limit access to the system
  As a money grubbing software develop
  I want to control who can enter the system 

 Scenario: Logging in with valid credentials
   Given I am at the login page
   When I log in as a valid user
   Then I should be on the Employee Listing page 
@wip
  Scenario: Can't log in with invalid credentials
    Given I am at the login page
    When I attempt to log in with invalid user credentials
    Then I should be at the login page
    And I should see a message "Invalid username/password"
