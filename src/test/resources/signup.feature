@SignUpFeature
Feature: Sign Up Feature
 
  Scenario: Valid Registration Form Information
    Given User submits a valid registration form
      | John | Doe | jdoe | testPass1 | jdoe@email.com |
    Then System proceeds with registration
 
  Scenario: Valid Registration Form Information with Header
    Given User submits a valid registration form header
      | FirstName | LastName | Username | Password  | Email          |
      | John      | Doe      | jdoe     | testPass1 | jdoe@email.com |
    Then System proceeds with registration
 
  Scenario: Valid Registration Form Information with Header and Multiple Rows
    Given User submits valid registration forms
      | FirstName | LastName | Username | Password  | Email              |
      | John      | Doe      | jdoe     | testPass1 | jdoe@email.com     |
      | Anne      | Smith    | asmith   | testPass2 | asmith@email.com   |
      | Mike      | Stewart  | mstewart | testPass3 | mstewart@email.com |
    Then All Forms will proceed with registration
 
  Scenario: Invalid Registration Forms
    Given User submits invalid registration forms
      | FirstName | LastName | Username | Password  | Email            |
      |           | Doe      | jdoe     | testPass1 | jdoe@email.com   |
      | Anne      |          | asmith   | testPass2 | asmith@email.com |
      | Mike      | Stewart  | mstewart | testPass3 | invalidEmail!@   |
    Then All Forms will be declined and not registered
