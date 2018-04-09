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
 


#import "PROPERTYPropertyMangementClient.h"
#import <AWSCore/AWSCore.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>

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

@interface AWSAPIGatewayClient()

// Networking
@property (nonatomic, strong) NSURLSession *session;

// For requests
@property (nonatomic, strong) NSURL *baseURL;

// For responses
@property (nonatomic, strong) NSDictionary *HTTPHeaderFields;
@property (nonatomic, assign) NSInteger HTTPStatusCode;

- (AWSTask *)invokeHTTPRequest:(NSString *)HTTPMethod
                     URLString:(NSString *)URLString
                pathParameters:(NSDictionary *)pathParameters
               queryParameters:(NSDictionary *)queryParameters
              headerParameters:(NSDictionary *)headerParameters
                          body:(id)body
                 responseClass:(Class)responseClass;

@end

@interface PROPERTYPropertyMangementClient()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation PROPERTYPropertyMangementClient

static NSString *const AWSInfoClientKey = @"PROPERTYPropertyMangementClient";

@synthesize configuration = _configuration;

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultClient {
    AWSServiceConfiguration *serviceConfiguration = nil;
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoClientKey];
    if (serviceInfo) {
        serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                           credentialsProvider:serviceInfo.cognitoCredentialsProvider];
    } else if ([AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        serviceConfiguration = AWSServiceManager.defaultServiceManager.defaultServiceConfiguration;
    } else {
        serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown
                                                           credentialsProvider:nil];
    }

    static PROPERTYPropertyMangementClient *_defaultClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultClient = [[PROPERTYPropertyMangementClient alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultClient;
}

+ (void)registerClientWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[PROPERTYPropertyMangementClient alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)clientForKey:(NSString *)key {
    @synchronized(self) {
        PROPERTYPropertyMangementClient *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoClientKey
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [PROPERTYPropertyMangementClient registerClientWithConfiguration:serviceConfiguration
                                                    forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeClientForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultClient` or `+ clientForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        NSString *URLString = @"https://infleu9vvd.execute-api.us-east-2.amazonaws.com/beta";
        if ([URLString hasSuffix:@"/"]) {
            URLString = [URLString substringToIndex:[URLString length] - 1];
        }
        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAPIGateway
                                                                  URL:[NSURL URLWithString:URLString]];

        AWSSignatureV4Signer *signer =  [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                         endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
    }
    
    return self;
}

- (AWSTask *)backgroundCheckGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/background-check"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYTenantBackgroundResult class]];
}

- (AWSTask *)backgroundCheckPut:(PROPERTYTenantBackgroundInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/background-check"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)backgroundCheckPost:(PROPERTYTenantBackgroundInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/background-check"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)generalExpensesGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/general-expenses"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYPropertyGeneralExpResult class]];
}

- (AWSTask *)generalExpensesPut:(PROPERTYPropertyGeneralExpInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/general-expenses"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)generalExpensesPost:(PROPERTYPropertyGeneralExpInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/general-expenses"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)maintenanceExpenseGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/maintenance-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYMaintenanceExpTypeResult class]];
}

- (AWSTask *)maintenanceExpensePut:(PROPERTYMaintenanceExpTypeInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/maintenance-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)maintenanceExpensePost:(PROPERTYMaintenanceExpTypeInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/maintenance-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propMaintExpenseGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/prop-maint-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYPropertyMaintExpResult class]];
}

- (AWSTask *)propMaintExpensePut:(PROPERTYPropertyMaintExpInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/prop-maint-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propMaintExpensePost:(PROPERTYPropertyMaintExpInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/prop-maint-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propMortgageLoanGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/prop-mortgage-loan"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYPropertyMortgageLoanResult class]];
}

- (AWSTask *)propMortgageLoanPut:(PROPERTYPropertyMortgageLoanInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/prop-mortgage-loan"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propMortgageLoanPost:(PROPERTYPropertyMortgageLoanInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/prop-mortgage-loan"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propOwnerGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/prop-owner"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYPropertyOwnerResult class]];
}

- (AWSTask *)propOwnerPut:(PROPERTYPropertyOwnerInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/prop-owner"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propOwnerPost:(PROPERTYPropertyOwnerInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/prop-owner"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propTaxGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/prop-tax"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYPropertyTaxResult class]];
}

- (AWSTask *)propTaxPut:(PROPERTYPropertyTaxInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/prop-tax"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propTaxPost:(PROPERTYPropertyTaxInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/prop-tax"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propertiesGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/properties"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYPropertyResult class]];
}

- (AWSTask *)propertiesPut:(PROPERTYPropertyInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/properties"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)propertiesPost:(PROPERTYPropertyInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/properties"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)purchaseDetailsGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/purchase-details"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYPurchaseDetailsResult class]];
}

- (AWSTask *)purchaseDetailsPut:(PROPERTYPurchaseDetailsInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/purchase-details"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)purchaseDetailsPost:(PROPERTYPurchaseDetailsInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/purchase-details"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)rentalAgreementGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/rental-agreement"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYRentalAgreementResult class]];
}

- (AWSTask *)rentalAgreementPut:(PROPERTYRentalAgreementInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/rental-agreement"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)rentalAgreementPost:(PROPERTYRentalAgreementInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/rental-agreement"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/tenants"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYTenantResult class]];
}

- (AWSTask *)tenantsPut:(PROPERTYTenantInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/tenants"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsPost:(PROPERTYTenantInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/tenants"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsIncomeExpenseGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/tenants-income-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYTenantIncomeResult class]];
}

- (AWSTask *)tenantsIncomeExpensePut:(PROPERTYTenantIncomeInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/tenants-income-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsIncomeExpensePost:(PROPERTYTenantIncomeInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/tenants-income-expense"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsOccupationGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/tenants-occupation"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYTenantOccupationResult class]];
}

- (AWSTask *)tenantsOccupationPut:(PROPERTYTenantOccupationInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/tenants-occupation"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsOccupationPost:(PROPERTYTenantOccupationInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/tenants-occupation"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsReferenceGet {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"GET"
                         URLString:@"/tenants-reference"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:nil
                     responseClass:[PROPERTYTenantRefResult class]];
}

- (AWSTask *)tenantsReferencePut:(PROPERTYTenantRefInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"PUT"
                         URLString:@"/tenants-reference"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}

- (AWSTask *)tenantsReferencePost:(PROPERTYTenantRefInput *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/tenants-reference"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[PROPERTYEmpty class]];
}



@end
