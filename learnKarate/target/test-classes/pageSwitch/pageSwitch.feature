Feature: Basic Page Switch Functionality

  Background: Settings up driver options
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*","--incognito"], highlight:true, highlightDuration:1000 }
    * driver 'https://the-internet.herokuapp.com/windows'
    * driver.maximize()

  @pageSwitch
  Scenario: Try Page Switch
    * print driver.title
    * retry(15).waitForEnabled("//div[@class='example']//a").click()
    * switchPage('New Window')
    * print driver.title
    * print text("//h3")
    * switchPage('The Internet')
    * print text("//div[@class='example']//h3")
    * def bytes = screenshot("//div[@class='example']//h3", false)
    * karate.write(bytes, 'snapTest.png')