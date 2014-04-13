Feature: Employee Directory
  In order to know how to contact my employees 
  As a manager of a small business
  I want to keep my employee contact information organized

  Scenario: Displaying a list of employees 
    Given the following employees have been created: 
      | Name | Mobile Phone Number  | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |
    When I view all of my employees 
    Then I should see the following employees listed: 
      | Name | Mobile Phone Number  | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |


