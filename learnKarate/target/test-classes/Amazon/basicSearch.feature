Feature: Basic Search on Amazon

  Background: Settings up driver options
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"], highlight:true, highlightDuration:1000 }
    * def OR = read('classpath:Amazon/_common/or.json')


  @basicSearchAmazon
  Scenario: Try Basic Search in Amazon
    * driver 'https://amazon.in'
    * driver.maximize()
    * waitFor(OR.homeAmazon.input_searchHome).click()
    * input(OR.homeAmazon.input_searchHome,"Shirt")
    * waitFor(OR.homeAmazon.btn_searchSubmit).click()
    * def title1 = driver.title
    * print title1
    * waitForEnabled(OR.homeAmazon.div_firstResult).click()
    * delay(5000)
    * def title1 = driver.title
    * print title1
    * switchPage(1)
    * def title1 = driver.title
    * print title1
