Feature: Agents or representatives can register on behalf of someone who pays for social care directly

  As an agent/representative who is acting on behalf of someone who pays for their own care, I should be able to
  provide my client's details and register for the scheme on their behalf.
@wip
  Scenario: Agent acting on a user with a UK address can register them for the scheme
    Given I am on the social care compliance homepage
    When I choose the "An agent or representative of someone who pays for care directly" option
    And I click continue
    Then I will be asked for my client's full name
    When I enter my client's full name
    And I click continue
    Then I will be asked if their address is in the UK
    When I choose the "Yes" option
    And I click continue
    Then I will be asked for my client's address
    When I enter the address as
      | Field           | Value             |
      | addressLine1    | 45 Byker Grove    |
      | addressLine2    | Newcastle         |
      | postcode        | NE98 1ZZ          |
    And I click continue
    Then I will be asked for my client's telephone number
    When I enter their telephone number
    And I click continue
    Then I will be asked if my client has an email address
    When I choose the "No" option
    And I click continue
    Then I will be asked if they have a UTR
    When I choose the "No" option
    And I click continue
    Then I will be asked if they have a PAYE reference number
    When I choose the "No" option
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
    Then I will be asked to check my answers
    When I check my answers they should be
      | Field                                                                      | Answer                                                           |
      | Which option best describes you?                                           | An agent or representative of someone who pays for care directly |
      | Name of the person who pays for care                                       | Mary Sue                                                         |
      | Is the address of the person who pays for care in the UK?                  | Yes                                                              |
      | Address of the person who pays for care                                    | 45 Byker Grove Newcastle NE98 1ZZ                                |
      | Telephone number of the person who pays for care                           | 01912359876                                                      |
      | Does the person who pays for care have an email address?                   | No                                                               |
      | Does the person who pays for care have a Unique Taxpayer Reference number? | No                                                               |
      | Does the person who pays for care have a Pay As You Earn reference number? | No                                                               |
      | Your name                                                                  | Bob Dole                                                         |
      | Is your address in the UK?                                                 | Yes                                                              |
      | Your address                                                               | 123 Fake Street Fake town NE98 1ZZ                               |
      | Your telephone number                                                      | 07123456789                                                      |
      | Do you have an email address?                                              | No                                                               |
    And I click continue
    Then my application will be sent