Feature: Sauce Labs ScreenShot Testing through Karate

  Background: Setting up driver options
    * def OR = read('classpath:sauceLabs/_common/or.json')
    #Call login feature file
    * call read('classpath:sauceLabs/reUsableCode/userLogin.feature@loginWithStandardUser')


  @sauceSnap
  Scenario: SnapShot Karate Different Types
    * waitFor(OR.homePage.txt_appLogo)
    * screenshot()
    * delay(2000).screenshot()
    * screenshot("//div[text()='Sauce Labs Backpack']/../../../..")
    * def bytesFile = screenshot("//div[text()='Sauce Labs Backpack']/../../../..", false)
    * karate.write(bytesFile, 'partSnap.png')
    * def bytesFile = screenshot(false)
    * karate.write(bytesFile, 'fullSnap.png')