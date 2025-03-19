@alertDialogFunctionality
Feature: Basic Alert Dialog Functionality

  Background: Settings up driver options
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"], highlight:true, highlightDuration:1000 }
    * driver 'https://www.google.com/'
    * driver.maximize()

  @alertDialogSample
  Scenario: Try Alert Dialog
    * driver 'https://alertdialog-aniscripthub.netlify.app/'
    * waitForEnabled("//button[@data-selector='alert-button']").click()
    * print driver.dialogText
    * dialog(true)
    * waitForEnabled("//button[@data-selector='fill-button']").click()
    * print driver.dialogText
    * dialog(true,'AniScript Hub')
    * print driver.dialogText
    * dialog(true, 'India')
    * print driver.dialogText
    * dialog(true, 'Yes')
    * match enabled("//button[@id='submitBtn']") == true
    * screenshot()
    * waitForEnabled("//button[@id='submitBtn']").click()
    * delay(5000)
    * print driver.dialogText
    * delay(5000)
    * dialog(true)
    * delay(5000)