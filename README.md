# Landlord Mobile

Today, landlords are overwhelmed with the amount of information they have to deal with - information about properties, taxes, expenses, tenants & their backgrounds to name a few.  Worse, keeping track of receipts and association with properties can be time-consuming.  

Come year end tax season, this can further aggravate the situation adding further to the frustration. We want to promote the concept of self-service property management by way of mobile-enabled application, allowing landlords to focus on investments rather than managing clutter of paper documents.

Originating as a web app, Landlord Mobile was designed as a concept of self-service property management by way of mobile-enabled application, allowing landlords to focus on investments rather than managing clutter of paper documents. We have implemented an iPhone mobile application to solve the problem. Since more and more users are using cell phone intensively, our Landlord Mobile iOS app would assist them to manage properties via their mobile devices without requiring a computer. 



#### App version
- 1.0.0

#### Requirements
- Xcode 8 and later
- iOS 8 and later

#### Using the app
- To import the required AWS Mobile SDK components into the Xcode project by using CocoaPods, do the following:
   - ` sudo gem install cocoapods `
   - ` pod setup `
- To install the AWS Mobile SDK for iOS, change the current directory to the one with your Podfile in it and run the following command:
    - ` pod install `
- Close the Xcode project and then open the *.xcworkspace file to relaunch Xcode.

#### Initialization steps:
- git clone 
- cd LLM
- cd app_LandlordMobile

#### AWS Permissions
   - ` AmazonDynamoDBFullAccess `
   - ` AWSLambdaDynamoDBFullAccessWithDataPipeline`
   - ` AmazonAPIGatewayAdminstrator`
   - ` AWSLambdaBasicExecutionRole`
   - ` AWSCloudFormationReadOnlyAccess`
   - ` ResourceGroupsAndTagEditorReadOnlyAccess`
   - ` ResourceGroupsAndTagEditorFullAccess`
   - ` IAMReadOnlyAccess `
   - ` IAMSelfManageServiceSpecificCredentials `

#### Software
 - To design and generate the user interfaces, download ` Sketch 49.2 ` from the website:
   - https://www.sketchapp.com/
 - If the there's a more updated version can download the latest version. Installed it on the PC and open it up for UI design. All the previous resources are already imported into the project ` Assets ` folder. You can follow the tutorial online to design the UI for iOS app: 
   - https://www.sketchapp.com/docs/
