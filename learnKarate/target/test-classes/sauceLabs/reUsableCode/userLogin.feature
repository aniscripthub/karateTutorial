@ignore
Feature: Re-Usable COde to login to Sauce Labs Website

  Background: Setting up user profile
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*","incognito"], highlight:true, highlightDuration:3000 }
    * def users = read('classpath:users.json')
    * driver 'https://www.saucedemo.com/'
    * driver.maximize()


@loginWithStandardUser
Scenario: Login with Standard User
  * waitFor(OR.loginPage.text_userName)
  * input(OR.loginPage.text_userName,users.user2.user)
  * waitFor(OR.loginPage.text_password)
  * input(OR.loginPage.text_password,users.user2.cred)
  * waitForEnabled(OR.loginPage.btn_signIn).click()
