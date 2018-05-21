Feature: Companies that employ social care workers can register to pay social care

  As a company who employs social care workers, I should be able to
  provide my details and register for the scheme to pay social care for my employees.

  Scenario: Employer with a UK address can register for the scheme
    Given I am on the social care compliance homepage
    When I choose the "A company that employs social care worker" option
    And I click continue
    Then I will be asked for my full name
    When I enter my full name
    And I click continue
    Then I will be asked for the company name
    When I enter the company name
    And I click continue
    Then I will be asked if the company's address is in the UK
    When I choose the "Yes" option
    And I click continue
    Then I will be asked for my company's address
    When I enter the address as
      | Field           | Value                 |
      | addressLine1    | 76 Greenfield Lane    |
      | addressLine2    | Newcastle             |
      | postcode        | NE98 1ZZ              |
    And I click continue
    Then I will be asked for the company's telephone number
    When I enter the company telephone number
    And I click continue
    Then I will be asked if the company has an email address
    When I choose the "No" option
    And I click continue
    Then I will be asked if the company have a UTR
    When I choose the "No" option
    And I click continue
    Then I will be asked if the company have a PAYE reference number
    When I choose the "No" option
    And I click continue
    Then I will be asked to check my answers
    When I check my answers they should be
      | Field                                                     | Answer                                    |
      | Which option best describes you?                          | A company that employs social care worker |
      | Your name                                                 | Bob Dole                                  |
      | Company name                                              | Social Care Inc.                          |
      | Is the company’s address in the UK?                       | Yes                                       |
      | Company’s address                                         | 76 Greenfield Lane Newcastle NE98 1ZZ     |
      | Company’s telephone number                                | 01919876543                               |
      | Does the company have an email address?                   | No                                        |
      | Does the company have a Unique Taxpayer Reference number? | No                                        |
      | Does the company have a Pay As You Earn reference number? | No                                        |
    And I click continue
    Then my application will be sent