@javascript
Feature: invitation acceptance
    Scenario: accept invitation from admin
      Given I have been invited by an admin
      And I am on my acceptance form page
      And I fill in the following:
        | user_username              | ohai           |
        | user_email                 | woot@sweet.com |
        | user_password         | secret         |
        | user_password_confirmation | secret         |
      And I press "Create my account"
      Then I should be on the getting started page
      And I should see "Well, hello there!"
      And I fill in the following:
        | profile_first_name | O             |

      When I follow "awesome_button"
      Then I should be on the multi page

    Scenario: accept invitation from user
      Given I have been invited by a user
      And I am on my acceptance form page
      And I fill in the following:
        | user_username              | ohai           |
        | user_email                 | woot@sweet.com |
        | user_password         | secret         |
        | user_password_confirmation | secret         |
      And I press "Create my account"
      Then I should be on the getting started page
      And I should see "Well, hello there!"
      And I fill in the following:
        | profile_first_name | O             |

      When I follow "awesome_button"
      Then I should be on the multi page

    Scenario: sends an invitation
      Given a user with email "bob@bob.bob"
      When I sign in as "bob@bob.bob"
      And I follow "By email"
      And I fill in "user_email" with "alex@example.com"
      And I press "Send an invitation"
      Then I should have 1 Devise email delivery
