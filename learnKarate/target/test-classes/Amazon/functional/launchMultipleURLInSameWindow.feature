Feature: Launch Multiple URL in Same Window

  Background: Settings up driver options
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"], highlight:true, highlightDuration:1000 }


  @multipleURLLoad
  Scenario: Launch more than 1 URL in Same Browser Window
    * driver 'https://www.google.in/'
    * driver.maximize()
    * script("window.open('https://www.amazon.in/','Amazon')")
    * def title1 = driver.title
    * print title1
    * switchPage('Amazon')
    * def title2 = driver.title
    * print title2