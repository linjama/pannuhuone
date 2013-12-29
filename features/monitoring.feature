Feature: Monitor status of heating room

  I wan to know without visiting in the heating room:
  1) What is the current status
     1a) Are the logs firing properly?
     1b) Which are key temperatures?
  2) When is the heating needed
  3) Collect statistics about energy consumption
     3a) What is the log consumption?
     3b) What is the energy produced by solar heating (?)


Scenario: I want to check the current status when fire is on
  When I visit the home page with my smartphone
  Then I see the exhaust gas and boiler temperatures