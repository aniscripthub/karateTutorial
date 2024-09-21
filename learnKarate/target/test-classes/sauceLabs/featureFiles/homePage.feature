Feature: Sauce Labs Home Page

  Background: Setting up driver options
    * def OR = read('classpath:sauceLabs/_common/or.json')
    #Call login feature file
    * call read('classpath:sauceLabs/reUsableCode/userLogin.feature@loginWithStandardUser')


  @homePage
  Scenario: Load HomePage
    * screenshot()
    * waitFor(OR.homePage.txt_appLogo)
    * def logoName = text(OR.homePage.txt_appLogo)
    * match logoName == "Swag Labs"
    * match logoName contains "Swag"
    * match logoName contains "Labs"