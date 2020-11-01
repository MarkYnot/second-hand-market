@LoginTest
Feature: User login
  I want to use this template for my feature file

Scenario: Login Functionality
Given user navigates to login.jsp
When user logs in using Username as “USER” and Password “PASSWORD”
Then login should be successful

Scenario: Login Functionality

Given user navigates tologin.jsp
When user logs in using Username as “USER1” and Password “PASSWORD1”
Then error message should throw