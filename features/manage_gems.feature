Feature: Manage gems
  In order to manage gems
  a webmaster
  wants to list, update and remove installed gems and add new gems

  Scenario: List installed gems
	Given I am on the index page
	Then I should see "Title"
	And I should see "Version"
  
  Scenario: Install new gem
	Given I am on the index page
	When I fill in "New Gem" with "abstract"
	And I press "Install"
	Then I should see "abstract"

  #   Given I am on the new gem page
  #   When I fill in "Title" with "title 1"
  #   And I fill in "Version" with "version 1"
  #   And I fill in "State" with "state 1"
  #   And I fill in "Compliance" with "compliance 1"
  #   And I fill in "Configure" with "configure 1"
  #   And I fill in "Staged at" with the current time
  #   And I fill in "Deployed at" with the current time
  #   And I press "Create"
  #   Then I should see "title 1"
  #   And I should see "version 1"
  #   And I should see "state 1"
  #   And I should see "compliance 1"
  #   And I should see "configure 1"
  #  And I should see "staged_at 1"
  #  And I should see "deployed_at 1"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
  # Scenario: Delete gem
  #   Given the following gems:
  #     |title|version|state|compliance|configure|staged_at|deployed_at|
  #     |title 1|version 1|state 1|compliance 1|configure 1|staged_at 1|deployed_at 1|
  #     |title 2|version 2|state 2|compliance 2|configure 2|staged_at 2|deployed_at 2|
  #     |title 3|version 3|state 3|compliance 3|configure 3|staged_at 3|deployed_at 3|
  #     |title 4|version 4|state 4|compliance 4|configure 4|staged_at 4|deployed_at 4|
  #   When I delete the 3rd gem
  #   Then I should see the following gems:
  #     |Title|Version|State|Compliance|Configure|Staged at|Deployed at|
  #     |title 1|version 1|state 1|compliance 1|configure 1|staged_at 1|deployed_at 1|
  #     |title 2|version 2|state 2|compliance 2|configure 2|staged_at 2|deployed_at 2|
  #     |title 4|version 4|state 4|compliance 4|configure 4|staged_at 4|deployed_at 4|
