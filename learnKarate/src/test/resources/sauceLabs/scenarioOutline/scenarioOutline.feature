@scenarioOut
Feature: Karate Automation Code to Demonstrate Scenario Outline Functionality

  Background: Setting up user profile
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"], highlight:true, highlightDuration:1000 }
    * driver 'https://www.google.com/'
    * driver.maximize()
    * def users = read('classpath:users.json')
    * def OR = read('classpath:sauceLabs/_common/or.json')

  @alertDialogSample
  Scenario Outline: Try Scenario Outline
    * driver 'https://www.saucedemo.com/'
    * waitFor(OR.loginPage.text_userName)
    * input(OR.loginPage.text_userName,<username>)
    * waitFor(OR.loginPage.text_password)
    * input(OR.loginPage.text_password,<password>)
    * waitForEnabled(OR.loginPage.btn_signIn).click()
    * delay(10000)
    * screenshot()

    Examples:
      |   username       |    password      |
      | users.user2.user | users.user2.cred |
      | users.user3.user | users.user3.cred |
      | users.user4.user | users.user4.cred |
