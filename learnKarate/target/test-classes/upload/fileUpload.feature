@fileUploadFunctionality
Feature: Basic File Upload Functionality

  Background: Settings up driver options
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"], highlight:true, highlightDuration:1000 }
    * driver 'https://www.google.com/'
    * driver.maximize()
    * def uploadPath = "file:C://Users//Ankit//Downloads//onedrive - test//Formate.pdf"

  @fileUpload
  Scenario: Try file Upload
    * driver 'https://practice.expandtesting.com/upload'
    * def inputLocator = "//input[@type='file']"
    * waitFor(inputLocator)
    * driver.inputFile(inputLocator, uploadPath)
    * screenshot()
    * waitForEnabled("//button[@type='submit']").click()
    * waitFor("//div[@id='uploaded-files']")
    * print text("//div[@id='uploaded-files']")

  @fileUpload-2
  Scenario: File-Upload Scenario-2
    * driver 'https://qa-automation-practice.netlify.app/file-upload.html'
    * def inputLocator = "//input[@type='file']"
    * waitFor(inputLocator)
    * driver.inputFile(inputLocator, uploadPath)
    * screenshot()
    * waitForEnabled("//button[@type='submit']").click()
    * waitFor("//div[@id='file_upload_response']")
    * print text("//div[@id='file_upload_response']")
