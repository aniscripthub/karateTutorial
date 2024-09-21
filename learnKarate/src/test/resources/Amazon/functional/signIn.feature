Feature: Basic Search on Amazon

  Background: Setting up driver options
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"], highlight:true, highlightDuration:3000 }
    * def OR = read('classpath:Amazon/_common/or.json')
    * def creds = read('classpath:users.json')

  @basicSearchAmazon
  Scenario: Amazon Basic Sign In
    * driver 'https://amazon.in'
    * driver.maximize()
    * waitForEnabled(OR.homeAmazon.href_signIn).click()
    * input(OR.signIn.input_user,creds.user1.userSign)
    * waitForEnabled(OR.signIn.btn_continue).click()
    * delay(2000)
    * input(OR.signIn.input_cred,creds.user1.userCred)
    * delay(2000)
    * waitForEnabled(OR.signIn.btn_submit).click()
    * delay(5000)
    * def userData = text(OR.signIn.span_userDetails)
    * print userData
    * def verifyRes = "Hello, " + creds.user1.userName
    * print verifyRes
    * match userData == verifyRes
    * call read('classpath:reUsableCode/search.feature@reUsableSearch')