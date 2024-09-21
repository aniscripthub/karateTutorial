Feature: Amazon Reusable code


@reUsableSearch
Scenario: Search Re-Usable Code
  * waitFor(OR.homeAmazon.input_searchHome)
  * waitForEnabled(OR.homeAmazon.input_searchHome).click()
  * input(OR.homeAmazon.input_searchHome,"iQOO Z7")
  * waitForEnabled(OR.homeAmazon.btn_searchSubmit).click()
  * delay(5000)
  * waitForEnabled(OR.homeAmazon.div_firstResult).click()
  * delay(5000)
  * switchPage(1)
  * def title1 = driver.title
  * print title1
  * screenshot()