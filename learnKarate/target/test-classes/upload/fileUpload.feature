Feature: Basic File Upload Functionality

  Background: Settings up driver options
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"], highlight:true, highlightDuration:1000 }
    * driver 'https://practice.expandtesting.com/upload'
    * driver.maximize()

  @fileUpload
  Scenario: Try file Upload
    * waitFor("//input[@type='file']").click()
    * def uploadPath = "file:C://Users//Ankit//Downloads//onedrive - test//Formate.pdf"
    * driver.inputFile("//input[@type='file']",uploadPath)
    * screenshot()
    * delay(5000)
    * waitForEnabled("//button[@type='submit']").click()
    * retry(25).waitFor("//h1[contains(text(), 'File Uploaded!')]")