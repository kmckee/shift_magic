Feature: Employee Administration
  In order to know how to contact my employees 
  As a manager responsible for creating a schedule for employees 
  I want to keep my employee contact information organized

  Scenario: Displaying a list of employees 
    Given the following employees have been created: 
      | Name | Mobile Phone         | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |
    When I view all of my employees 
    Then I should see the following employees listed: 
      | Name | Mobile Phone         | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |
  
  Scenario: Creating an employee
    When I finish creating the following employee:
      | Name | Mobile Phone         | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |
    And I view all of my employees
    Then I should see the following employees listed:
      | Name | Mobile Phone         | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |

  Scenario: Viewing the details of an employee
    Given the following employees have been created: 
      | Name | Mobile Phone         | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |
    When I view the employee details for "Kyle"
    Then I should see the following employee details
      | Name | Mobile Phone         | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |

  Scenario: Updating an existing employee
    Given the following employees have been created: 
      | Name | Mobile Phone         | Email            |
      | Kyle | 440-555-1234         | kmckee@gmail.com |
    When I update the employee details for "Kyle" to the following:
      | Name       | Mobile Phone         | Email            |
      | Kyle McKee | 111-222-3333         | kyle@nowhere.com |
    And I view all of my employees
    Then I should see the following employees listed:
      | Name       | Mobile Phone         | Email            |
      | Kyle McKee | 111-222-3333         | kyle@nowhere.com |

    @wip
  Scenario: Deleting an existing employee
    Given the following employees have been created: 
      | Name        | Mobile Phone        | Email             |
      | Kyle McKee  | 111-222-3333        | kyle@nowhere.com  |
      | Julia McKee | 999-888-7777        | julia@nowhere.com |
    When I delete the employee named "Julia McKee"
    Then I should see the following employees listed:
      | Name       | Mobile Phone         | Email            |
      | Kyle McKee | 111-222-3333         | kyle@nowhere.com |

