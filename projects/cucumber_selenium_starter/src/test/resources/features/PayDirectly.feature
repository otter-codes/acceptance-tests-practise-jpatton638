Feature: Users can pay for their own care and register

  As a user who pays for their own care, I should be able to
  provide my details and register for the scheme.

  Scenario: User with a UK address can register for the scheme
    Given I am on the social care compliance homepage
    When I choose the "Someone who pays for care directly" option
    And I click continue
    Then I will be asked for my full name
    When I enter my full name
    And I click continue
    Then I will be asked if my address is in the UK
    When I choose the "Yes" option
    And I click continue
    Then I will be asked for my address
    When I enter the address as
      | Field           | Value             |
      | addressLine1    | 123 Fake Street   |
      | addressLine2    | Fake town         |
      | postcode        | NE98 1ZZ          |
    And I click continue
    Then I will be asked for my telephone number
    When I enter my telephone number
    And I click continue
    Then I will be asked if I have an email address
    When I choose the "No" option
    And I click continue
    Then I will be asked if I have a UTR
    When I choose the "No" option
    And I click continue
    Then I will be asked if I have a PAYE reference number
    When I choose the "No" option
    And I click continue
    Then I will be asked to check my answers
    When I check my answers they should be
      | Field                                           | Answer                             |
      | Which option best describes you?                | Someone who pays for care directly |
      | Your name                                       | Bob Dole                           |
      | Is your address in the UK?                      | Yes                                |
      | Your address                                    | 123 Fake Street Fake town NE98 1ZZ |
      | Your telephone number                           | 07123456789                        |
      | Do you have an email address?                   | No                                 |
      | Do you have a Unique Taxpayer Reference number? | No                                 |
      | Do you have a Pay As You Earn reference number? | No                                 |
    And I click continue
    Then my application will be sent