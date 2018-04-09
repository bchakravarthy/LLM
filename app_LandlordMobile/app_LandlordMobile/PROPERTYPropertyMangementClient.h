/*
 Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */
 

#import <Foundation/Foundation.h>
#import <AWSAPIGateway/AWSAPIGateway.h>

#import "PROPERTYTenantBackgroundResult.h"
#import "PROPERTYTenantBackgroundInput.h"
#import "PROPERTYEmpty.h"
#import "PROPERTYPropertyGeneralExpResult.h"
#import "PROPERTYPropertyGeneralExpInput.h"
#import "PROPERTYMaintenanceExpTypeResult.h"
#import "PROPERTYMaintenanceExpTypeInput.h"
#import "PROPERTYPropertyMaintExpResult.h"
#import "PROPERTYPropertyMaintExpInput.h"
#import "PROPERTYPropertyMortgageLoanResult.h"
#import "PROPERTYPropertyMortgageLoanInput.h"
#import "PROPERTYPropertyOwnerResult.h"
#import "PROPERTYPropertyOwnerInput.h"
#import "PROPERTYPropertyTaxResult.h"
#import "PROPERTYPropertyTaxInput.h"
#import "PROPERTYPropertyResult.h"
#import "PROPERTYPropertyInput.h"
#import "PROPERTYPurchaseDetailsResult.h"
#import "PROPERTYPurchaseDetailsInput.h"
#import "PROPERTYRentalAgreementResult.h"
#import "PROPERTYRentalAgreementInput.h"
#import "PROPERTYTenantResult.h"
#import "PROPERTYTenantInput.h"
#import "PROPERTYTenantIncomeResult.h"
#import "PROPERTYTenantIncomeInput.h"
#import "PROPERTYTenantOccupationResult.h"
#import "PROPERTYTenantOccupationInput.h"
#import "PROPERTYTenantRefResult.h"
#import "PROPERTYTenantRefInput.h"


NS_ASSUME_NONNULL_BEGIN

/**
 The service client object.
 */
@interface PROPERTYPropertyMangementClient: AWSAPIGatewayClient

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 If you want to enable AWS Signature, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let serviceClient = PROPERTYPropertyMangementClient.defaultClient()

 *Objective-C*

     PROPERTYPropertyMangementClient *serviceClient = [PROPERTYPropertyMangementClient defaultClient];

 Alternatively, this configuration could also be set in the `info.plist` file of your app under `AWS` dictionary with a configuration dictionary by name `PROPERTYPropertyMangementClient`.

 @return The default service client.
 */
+ (instancetype)defaultClient;

/**
 Creates a service client with the given service configuration and registers it for the key.

 If you want to enable AWS Signature, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         PROPERTYPropertyMangementClient.registerClientWithConfiguration(configuration, forKey: "USWest2PROPERTYPropertyMangementClient")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [PROPERTYPropertyMangementClient registerClientWithConfiguration:configuration forKey:@"USWest2PROPERTYPropertyMangementClient"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let serviceClient = PROPERTYPropertyMangementClient(forKey: "USWest2PROPERTYPropertyMangementClient")

 *Objective-C*

     PROPERTYPropertyMangementClient *serviceClient = [PROPERTYPropertyMangementClient clientForKey:@"USWest2PROPERTYPropertyMangementClient"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerClientWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerClientWithConfiguration:forKey:` before invoking this method or alternatively, set the configuration in your application's `info.plist` file. If `+ registerClientWithConfiguration:forKey:` has not been called in advance or if a configuration is not present in the `info.plist` file of the app, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         PROPERTYPropertyMangementClient.registerClientWithConfiguration(configuration, forKey: "USWest2PROPERTYPropertyMangementClient")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [PROPERTYPropertyMangementClient registerClientWithConfiguration:configuration forKey:@"USWest2PROPERTYPropertyMangementClient"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let serviceClient = PROPERTYPropertyMangementClient(forKey: "USWest2PROPERTYPropertyMangementClient")

 *Objective-C*

     PROPERTYPropertyMangementClient *serviceClient = [PROPERTYPropertyMangementClient clientForKey:@"USWest2PROPERTYPropertyMangementClient"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)clientForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeClientForKey:(NSString *)key;

/**
 
 
 
 return type: PROPERTYTenantBackgroundResult *
 */
- (AWSTask *)backgroundCheckGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)backgroundCheckPut:( PROPERTYTenantBackgroundInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)backgroundCheckPost:( PROPERTYTenantBackgroundInput *)body;

/**
 
 
 
 return type: PROPERTYPropertyGeneralExpResult *
 */
- (AWSTask *)generalExpensesGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)generalExpensesPut:( PROPERTYPropertyGeneralExpInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)generalExpensesPost:( PROPERTYPropertyGeneralExpInput *)body;

/**
 
 
 
 return type: PROPERTYMaintenanceExpTypeResult *
 */
- (AWSTask *)maintenanceExpenseGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)maintenanceExpensePut:( PROPERTYMaintenanceExpTypeInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)maintenanceExpensePost:( PROPERTYMaintenanceExpTypeInput *)body;

/**
 
 
 
 return type: PROPERTYPropertyMaintExpResult *
 */
- (AWSTask *)propMaintExpenseGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propMaintExpensePut:( PROPERTYPropertyMaintExpInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propMaintExpensePost:( PROPERTYPropertyMaintExpInput *)body;

/**
 
 
 
 return type: PROPERTYPropertyMortgageLoanResult *
 */
- (AWSTask *)propMortgageLoanGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propMortgageLoanPut:( PROPERTYPropertyMortgageLoanInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propMortgageLoanPost:( PROPERTYPropertyMortgageLoanInput *)body;

/**
 
 
 
 return type: PROPERTYPropertyOwnerResult *
 */
- (AWSTask *)propOwnerGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propOwnerPut:( PROPERTYPropertyOwnerInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propOwnerPost:( PROPERTYPropertyOwnerInput *)body;

/**
 
 
 
 return type: PROPERTYPropertyTaxResult *
 */
- (AWSTask *)propTaxGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propTaxPut:( PROPERTYPropertyTaxInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propTaxPost:( PROPERTYPropertyTaxInput *)body;

/**
 
 
 
 return type: PROPERTYPropertyResult *
 */
- (AWSTask *)propertiesGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propertiesPut:( PROPERTYPropertyInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)propertiesPost:( PROPERTYPropertyInput *)body;

/**
 
 
 
 return type: PROPERTYPurchaseDetailsResult *
 */
- (AWSTask *)purchaseDetailsGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)purchaseDetailsPut:( PROPERTYPurchaseDetailsInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)purchaseDetailsPost:( PROPERTYPurchaseDetailsInput *)body;

/**
 
 
 
 return type: PROPERTYRentalAgreementResult *
 */
- (AWSTask *)rentalAgreementGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)rentalAgreementPut:( PROPERTYRentalAgreementInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)rentalAgreementPost:( PROPERTYRentalAgreementInput *)body;

/**
 
 
 
 return type: PROPERTYTenantResult *
 */
- (AWSTask *)tenantsGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsPut:( PROPERTYTenantInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsPost:( PROPERTYTenantInput *)body;

/**
 
 
 
 return type: PROPERTYTenantIncomeResult *
 */
- (AWSTask *)tenantsIncomeExpenseGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsIncomeExpensePut:( PROPERTYTenantIncomeInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsIncomeExpensePost:( PROPERTYTenantIncomeInput *)body;

/**
 
 
 
 return type: PROPERTYTenantOccupationResult *
 */
- (AWSTask *)tenantsOccupationGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsOccupationPut:( PROPERTYTenantOccupationInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsOccupationPost:( PROPERTYTenantOccupationInput *)body;

/**
 
 
 
 return type: PROPERTYTenantRefResult *
 */
- (AWSTask *)tenantsReferenceGet;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsReferencePut:( PROPERTYTenantRefInput *)body;

/**
 
 
 @param body 
 
 return type: PROPERTYEmpty *
 */
- (AWSTask *)tenantsReferencePost:( PROPERTYTenantRefInput *)body;

@end

NS_ASSUME_NONNULL_END
