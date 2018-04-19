//
//  app_LandlordMobileTests.m
//  app_LandlordMobileTests
//
//  Created by Nafisa Hasan on 4/15/18.
//  Copyright © 2018 Nafisa Hasan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PROPERTYPropertyMangementClient.h"



@interface app_LandlordMobileTests : XCTestCase

@end

@implementation app_LandlordMobileTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast2
                                                          identityPoolId:@"us-east-2:673767f7-1e5f-431b-9bb2-4cfd8c9b3466"];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast2 credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


// MARK: Test cases for POST
- (void) testInsertExpenseType {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYMaintenanceExpTypeInput *input = [[PROPERTYMaintenanceExpTypeInput alloc] init];
    input.ownerId=[NSNumber numberWithInt:1];
    input._description=@"Test from Nafisa!";
    
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:input.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    if ([input._description isEqualToString:@"Test from Nafisa!"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    //Invoke POST on employee API
    [[client maintenanceExpensePost:input] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(input.ownerId, numberOne);
        XCTAssertEqual(input._description, @"Test from Nafisa!");
    }];
}

- (void) testInsertProperty {
    //Instantiate client object
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyInput *propertyInput = [[PROPERTYPropertyInput alloc] init];
    propertyInput.ownerId=[NSNumber numberWithInt:1];
    propertyInput.addressLine1 = @"123 Lane Ave";
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:propertyInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    
    if ([propertyInput.addressLine1 isEqualToString:@"123 Lane Ave"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    //Invoke POST on employee API
    [[client propertiesPost:propertyInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyInput.ownerId, numberOne);
        XCTAssertEqual(propertyInput.addressLine1, @"123 Lane Ave");
    }];
}

- (void) testInsertPropertyMaintExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMaintExpInput *propertyMaintInput = [[PROPERTYPropertyMaintExpInput alloc] init];
    
    propertyMaintInput.propertyId = [NSNumber numberWithInt:1];
    propertyMaintInput.ownerId = [NSNumber numberWithInt:1];
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:propertyMaintInput.propertyId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    
    if ([numberOne compare:propertyMaintInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    //Invoke POST on employee API
    [[client propMaintExpensePost:propertyMaintInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyMaintInput.ownerId, numberOne);
        XCTAssertEqual(propertyMaintInput.propertyId, numberOne);
    }];
}


- (void) testInsertPropertyGeneralExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyGeneralExpInput *propertyGeneralInput = [[PROPERTYPropertyGeneralExpInput alloc] init];
    
    propertyGeneralInput.propertyId = [NSNumber numberWithInt:1];
    propertyGeneralInput.ownerId = [NSNumber numberWithInt:1];
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:propertyGeneralInput.propertyId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    
    if ([numberOne compare:propertyGeneralInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    //Invoke POST on employee API
    [[client generalExpensesPost:propertyGeneralInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertEqual(propertyGeneralInput.ownerId, numberOne);
        XCTAssertEqual(propertyGeneralInput.propertyId, numberOne);
    }];
}


- (void) testInsertPropertyMortLoan {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMortgageLoanInput *propertyMortgageInput = [[PROPERTYPropertyMortgageLoanInput alloc] init];
    
    propertyMortgageInput.monthlyMortgageAmount = [NSNumber numberWithInt:1];
    propertyMortgageInput.outstandingBalance = [NSNumber numberWithInt:10];
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    NSNumber *numberTen = [NSNumber numberWithInt:10];
    if([numberOne compare:propertyMortgageInput.monthlyMortgageAmount] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    
    if ([numberTen compare:propertyMortgageInput.outstandingBalance] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    //Invoke POST
    [[client propMortgageLoanPost:propertyMortgageInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyMortgageInput.monthlyMortgageAmount, numberOne);
        XCTAssertEqual(propertyMortgageInput.outstandingBalance, numberTen);
    }];
}

- (void) testInsertPropertyOwner {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyOwnerInput *propertyOwnerInput = [[PROPERTYPropertyOwnerInput alloc] init];
    
    propertyOwnerInput.ownerName = @"Nafisa";
    propertyOwnerInput.email = @"Nafisa@gmail.com";
    
    
    if ([propertyOwnerInput.ownerName isEqualToString:@"Nafisa"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if ([propertyOwnerInput.email isEqualToString:@"Nafisa@gmail.com"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    
    //Invoke POST
    [[client propOwnerPost:propertyOwnerInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyOwnerInput.ownerName, @"Nafisa");
        XCTAssertEqual(propertyOwnerInput.email, @"Nafisa@gmail.com");
    }];
}


- (void) testInsertPropertyTax {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyTaxInput *propertyTaxInput = [[PROPERTYPropertyTaxInput alloc] init];
    propertyTaxInput.propertyId = [NSNumber numberWithInt:1];
    propertyTaxInput.ownerId = [NSNumber numberWithInt:1];
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    
    if([numberOne compare:propertyTaxInput.propertyId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    if([numberOne compare:propertyTaxInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    
    
    //Invoke POST
    [[client propTaxPost:propertyTaxInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyTaxInput.propertyId, numberOne);
        XCTAssertEqual(propertyTaxInput.ownerId, numberOne);
    }];
}

- (void) testInsertPurchaseDetails {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPurchaseDetailsInput *purchaseInput = [[PROPERTYPurchaseDetailsInput alloc] init];
    purchaseInput.yearOfPurchase=[NSNumber numberWithInt:2008];
    purchaseInput.price=[NSNumber numberWithInt:78500];
    
    NSNumber *numberTwoThousandEight = [NSNumber numberWithInt:2008];
    NSNumber *numberOther = [NSNumber numberWithInt:78500];
    if([numberTwoThousandEight compare:purchaseInput.yearOfPurchase] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    if([numberOther compare:purchaseInput.price] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    
    
    //Invoke POST
    [[client purchaseDetailsPost:purchaseInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(purchaseInput.yearOfPurchase, numberTwoThousandEight);
        XCTAssertEqual(purchaseInput.price, numberOther);
    }];
}

- (void) testInsertRentalAgreement {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYRentalAgreementInput *rentalAgreementInput = [[PROPERTYRentalAgreementInput alloc] init];
    rentalAgreementInput.monthlyRent=[NSNumber numberWithInt:500];
    rentalAgreementInput.monthlyRentDue = @"Today";
    
    NSNumber *numberFiveHundred = [NSNumber numberWithInt:500];
    
    if([numberFiveHundred compare:rentalAgreementInput.monthlyRent] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    if ([rentalAgreementInput.monthlyRentDue isEqualToString:@"Today"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    
    //Invoke POST
    [[client rentalAgreementPost:rentalAgreementInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(rentalAgreementInput.monthlyRent, numberFiveHundred);
        XCTAssertEqual(rentalAgreementInput.monthlyRentDue, @"Today");
    }];
}

- (void) testInsertTenantBackgroundCheck {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantBackgroundInput *backgroundCheckInput = [[PROPERTYTenantBackgroundInput alloc] init];
    backgroundCheckInput.evictionPassedYN=@"No";
    backgroundCheckInput.recommendation=@"Tenant has clean credit";
    
    if ([backgroundCheckInput.evictionPassedYN isEqualToString:@"No"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if ([backgroundCheckInput.recommendation isEqualToString:@"Tenant has clean credit"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    
    //Invoke POST
    [[client backgroundCheckPost:backgroundCheckInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(backgroundCheckInput.evictionPassedYN, @"No");
        XCTAssertEqual(backgroundCheckInput.recommendation, @"Tenant has clean credit");
    }];
}


- (void) testInsertTenantIncomeExpenses {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantIncomeInput *tenantIncomeInput = [[PROPERTYTenantIncomeInput alloc] init];
    tenantIncomeInput.monthlyIncome=[NSNumber numberWithInt:1000];
    tenantIncomeInput.monthlyExpenses=[NSNumber numberWithInt:100];
    
    NSNumber *numberHundred = [NSNumber numberWithInt:100];
    NSNumber *numberThousand = [NSNumber numberWithInt:1000];
    if([numberThousand compare:tenantIncomeInput.monthlyIncome] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    if([numberHundred compare:tenantIncomeInput.monthlyExpenses] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    
    //Invoke POST
    [[client tenantsIncomeExpensePost:tenantIncomeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantIncomeInput.monthlyExpenses, numberHundred);
        XCTAssertEqual(tenantIncomeInput.monthlyIncome, numberThousand);
    }];
}

- (void) testInsertTenantOccupation {
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantOccupationInput *tenantOccupationInput = [[PROPERTYTenantOccupationInput alloc] init];
    tenantOccupationInput.tenantId=[NSNumber numberWithInt:1];
    tenantOccupationInput.ownerId=[NSNumber numberWithInt:1];
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:tenantOccupationInput.tenantId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    if([numberOne compare:tenantOccupationInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    
    //Invoke POST
    [[client tenantsOccupationPost:tenantOccupationInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantOccupationInput.tenantId, numberOne);
        XCTAssertEqual(tenantOccupationInput.ownerId, numberOne);
    }];
}


- (void) testInsertTenantReferences {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantRefInput *tenantRefInput = [[PROPERTYTenantRefInput alloc] init];
    tenantRefInput.firstName = @"Nafisa";
    tenantRefInput.lastName = @"Hasan";
    
    if ([tenantRefInput.firstName isEqualToString:@"Nafisa"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if ([tenantRefInput.lastName isEqualToString:@"Hasan"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    //Invoke POST
    [[client tenantsReferencePost:tenantRefInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantRefInput.firstName, @"Nafisa");
        XCTAssertEqual(tenantRefInput.lastName, @"Hasan");
    }];
}


- (void) testInsertTenant {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantInput *tenantInput = [[PROPERTYTenantInput alloc] init];
    tenantInput.firstName = @"Nafisa";
    tenantInput.lastName = @"Hasan";
    
    if ([tenantInput.firstName isEqualToString:@"Nafisa"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if ([tenantInput.lastName isEqualToString:@"Hasan"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    //Invoke POST
    [[client tenantsPost:tenantInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantInput.firstName, @"Nafisa");
        XCTAssertEqual(tenantInput.lastName, @"Hasan");
    }];
}





// MARK: Test cases for GET
- (void) testGetExpenseType {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    //Invoke GET on API
    
    [[client maintenanceExpenseGet] continueWithBlock:^id(AWSTask *task){
        
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYMaintenanceExpTypeResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.maintenanceExpenseTypes;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of maintenance expenses %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetProperty {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client propertiesGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYPropertyResult *result_var;
            result_var=task.result;
            //Obtain array of properties
            NSArray *arrData = result_var.output.ownerProperties;
            long cnt;
            cnt = arrData.count;
            //Print out count of properties
            NSLog(@"Number of properties %lu\n",cnt);
            
            //Print out each prop details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetPropertyMaintExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client propMaintExpenseGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYPropertyMaintExpResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyMaintenanceExpenses;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of property maintenance expenses %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetPropertyGeneralExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client generalExpensesGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYPropertyGeneralExpResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyGeneralExpenses;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of general expenses %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetPropertyMortgageLoan {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client propMortgageLoanGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYPropertyMortgageLoanResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyMortgageLoan;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of mortgage loans %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetPropertyOwner {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client propOwnerGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYPropertyOwnerResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyOwner;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of maintenance expenses %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}


- (void) testGetPropertyTax {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client propTaxGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYPropertyTaxResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyTax;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of prop tax items %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}


- (void) testGetPurhcaseDetails {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client purchaseDetailsGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYPurchaseDetailsResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.purchaseDetails;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of purchase details %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetRentalAgreement {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client rentalAgreementGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYRentalAgreementResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.rentalAgreement;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of rental agreement items %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetTenantBackgroundCheck {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client backgroundCheckGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYTenantBackgroundResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantBackgroundCheck;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of rental agreement items %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetTenantIncomeExpenses {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client tenantsIncomeExpenseGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYTenantIncomeResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantIncomeExpense;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of rental agreement items %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}


- (void) testGetTenantOccupation {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client tenantsOccupationGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYTenantOccupationResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantOccupation;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of occupation items %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}


- (void) testGetTenantReferences {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client tenantsReferenceGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYTenantRefResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantReferences;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of occupation items %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}

- (void) testGetTenant {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client tenantsGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        if (task.result) {
            //You are here, so method invocation is a success
            printf("Success....\n");
            //Convert result object to maint result
            
            PROPERTYTenantResult *result_var;
            result_var=task.result;
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenants;
            long cnt;
            cnt = arrData.count;
            //Print out count of maint exp
            NSLog(@"Number of occupation items %lu\n",cnt);
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSLog(@"%@", element);
            }
        }
        return nil;
    }];
}


// MARK: Test cases for PUT
- (void) testUpdateExpenseType {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYMaintenanceExpTypeInput *MaintenanceExpenseTypeInput = [[PROPERTYMaintenanceExpTypeInput alloc] init];
    
    MaintenanceExpenseTypeInput.maintenanceExpenseId = [NSNumber numberWithInteger:1];
    MaintenanceExpenseTypeInput.ownerId=[NSNumber numberWithInt:1];
    MaintenanceExpenseTypeInput._description = @"New Coaches";
    
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:MaintenanceExpenseTypeInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    if ([MaintenanceExpenseTypeInput._description isEqualToString:@"Test from Nafisa!"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Item has been updated to New Coaches");
    }
    
    //Invoke Put on employee API
    [[client maintenanceExpensePut:MaintenanceExpenseTypeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertEqual(MaintenanceExpenseTypeInput.ownerId, numberOne);
        XCTAssertEqual(MaintenanceExpenseTypeInput._description, @"New Coaches");
    }];
}

- (void) testUpdateProperty {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyInput *propertyInput = [[PROPERTYPropertyInput alloc] init];
    
    propertyInput.ownerId=[NSNumber numberWithInt:3];
    propertyInput.addressLine1 = @"87 Summit ST";
    
    
    NSNumber *numberOne = [NSNumber numberWithInt:3];
    if([numberOne compare:propertyInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    if ([propertyInput.addressLine1 isEqualToString:@"Test from Nafisa!"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Item has been updated to 87 Summit ST");
    }
    
    //Invoke Put on employee API
    [[client propertiesPut:propertyInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertEqual(propertyInput.ownerId, numberOne);
        XCTAssertEqual(propertyInput._description, @"87 Summit ST");
    }];
}

- (void) testUpdateTenantReference {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantRefInput *tenantRefInput = [[PROPERTYTenantRefInput alloc] init];
    
    tenantRefInput.countyOrDistrict = @"Franklin";
    tenantRefInput.contactEmail = @"nafisa@gmail.com";
    
    
    if ([tenantRefInput.countyOrDistrict isEqualToString:@"Franklin"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if ([tenantRefInput.contactEmail isEqualToString:@"nafisa@gmail.com"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    
    //Invoke Put on employee API
    [[client tenantsReferencePut:tenantRefInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantRefInput.countyOrDistrict, @"Franklin");
        XCTAssertEqual(tenantRefInput.contactEmail, @"nafisa@gmail.com");
    }];
}

- (void) testUpdateTenant {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantInput *tenantInput = [[PROPERTYTenantInput alloc] init];
    
    tenantInput.tenantId = [NSNumber numberWithInt:1];
    tenantInput.ownerId=[NSNumber numberWithInt:20];
    
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    NSNumber *numberTwenty = [NSNumber numberWithInt:20];
    if([numberOne compare:tenantInput.tenantId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    
    if ([numberTwenty compare:tenantInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    //Invoke Put
    [[client tenantsPut:tenantInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantInput.tenantId, numberOne);
        XCTAssertEqual(tenantInput.ownerId, numberTwenty);
    }];
}

- (void) testUpdateTenantOccupation {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantOccupationInput *tenantOccupationInput = [[PROPERTYTenantOccupationInput alloc] init];
    
    tenantOccupationInput.tenantOccupationId=[NSNumber numberWithInt:4];
    tenantOccupationInput.tenantId=[NSNumber numberWithInt:6];
    
    
    NSNumber *numberFour = [NSNumber numberWithInt:4];
    NSNumber *numberSix = [NSNumber numberWithInt:6];
    if([numberSix compare:tenantOccupationInput.tenantId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    
    if ([numberFour compare:tenantOccupationInput.tenantOccupationId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    //Invoke Put
    [[client tenantsOccupationPut:tenantOccupationInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantOccupationInput.tenantId, numberSix);
        XCTAssertEqual(tenantOccupationInput.tenantOccupationId, numberFour);
    }];
}


- (void) testUpdateTenantIncomeExpenses {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantIncomeInput *tenantIncomeInput = [[PROPERTYTenantIncomeInput alloc] init];
    
    tenantIncomeInput.monthlyIncome=[NSNumber numberWithInt:1];
    tenantIncomeInput.monthlyExpenses=[NSNumber numberWithInt:1];
    
    NSNumber *numberHundred = [NSNumber numberWithInt:100];
    NSNumber *numberThousand = [NSNumber numberWithInt:1000];
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberThousand compare:tenantIncomeInput.monthlyIncome] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Income updated to 1");
    }
    if ([numberHundred compare:tenantIncomeInput.monthlyExpenses] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Expenses updated to 1");
    }
    //Invoke Put
    [[client tenantsIncomeExpensePut:tenantIncomeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(tenantIncomeInput.monthlyExpenses, numberOne);
        XCTAssertEqual(tenantIncomeInput.monthlyIncome, numberOne);
    }];
}

- (void) testUpdateTenantBackgroundCheck {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantBackgroundInput *backgroundCheckInput = [[PROPERTYTenantBackgroundInput alloc] init];
    backgroundCheckInput.evictionPassedYN=@"N";
    backgroundCheckInput.recommendation=@"Tenant has Bad credit";
    
    if ([backgroundCheckInput.evictionPassedYN isEqualToString:@"No"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Updated to N");
    }
    if ([backgroundCheckInput.recommendation isEqualToString:@"Tenant has clean credit"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Updated to Tenant has Bad credit");
    }
    //Invoke Put
    [[client backgroundCheckPut:backgroundCheckInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(backgroundCheckInput.evictionPassedYN, @"N");
        XCTAssertEqual(backgroundCheckInput.recommendation, @"Tenant has Bad credit");
    }];
}


- (void) testUpdateRentalAgreement {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYRentalAgreementInput *rentalAgreementInput = [[PROPERTYRentalAgreementInput alloc] init];
    rentalAgreementInput.monthlyRent=[NSNumber numberWithInt:1];
    rentalAgreementInput.monthlyRentDue = @"Today";
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    NSNumber *numberFiveHundred = [NSNumber numberWithInt:500];
    if([numberFiveHundred compare:rentalAgreementInput.monthlyRent] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Updated to 1");
    }
    if ([rentalAgreementInput.monthlyRentDue isEqualToString:@"Today"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    //Invoke Put
    [[client rentalAgreementPut:rentalAgreementInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(rentalAgreementInput.monthlyRent, numberOne);
        XCTAssertEqual(rentalAgreementInput.monthlyRentDue, @"Today");
    }];
}

- (void) testUpdatePurchaseDetails {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPurchaseDetailsInput *purchaseInput = [[PROPERTYPurchaseDetailsInput alloc] init];
    purchaseInput.yearOfPurchase=[NSNumber numberWithInt:2000];
    purchaseInput.price=[NSNumber numberWithInt:78500];
    
    NSNumber *numberTwoThousandEight = [NSNumber numberWithInt:2008];
    NSNumber *numberTwoThousand = [NSNumber numberWithInt:2000];
    NSNumber *numberOther = [NSNumber numberWithInt:78500];
    if([numberTwoThousandEight compare:purchaseInput.yearOfPurchase] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Updated to 2000");
    }
    if([numberOther compare:purchaseInput.price] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    //Invoke Put
    [[client purchaseDetailsPut:purchaseInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(purchaseInput.yearOfPurchase, numberTwoThousand);
        XCTAssertEqual(purchaseInput.price, numberOther);
    }];
}

- (void) testUpdatePropertyTax {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyTaxInput *propertyTaxInput = [[PROPERTYPropertyTaxInput alloc] init];
    propertyTaxInput.propertyId = [NSNumber numberWithInt:1];
    propertyTaxInput.ownerId = [NSNumber numberWithInt:1];
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:propertyTaxInput.propertyId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if([numberOne compare:propertyTaxInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    //Invoke Put
    [[client propTaxPut:propertyTaxInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyTaxInput.propertyId, numberOne);
        XCTAssertEqual(propertyTaxInput.ownerId, numberOne);
    }];
}


- (void) testUpdatePropertyOwner {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyOwnerInput *propertyOwnerInput = [[PROPERTYPropertyOwnerInput alloc] init];
    propertyOwnerInput.ownerName = @"Yaman";
    propertyOwnerInput.email = @"Yaman@gmail.com";
    
    
    if ([propertyOwnerInput.ownerName isEqualToString:@"Nafisa"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Updated to Yaman");
    }
    
    if ([propertyOwnerInput.email isEqualToString:@"Nafisa@gmail.com"])
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Updated to Yaman@gmail.com");
    }
    
    
    //Invoke Put
    [[client propOwnerPut:propertyOwnerInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyOwnerInput.ownerName, @"Yaman");
        XCTAssertEqual(propertyOwnerInput.email, @"Yaman@gmail.com");
    }];
}

- (void) testUpdatePropertyMortgageLoan {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMortgageLoanInput *propertyMortgageInput = [[PROPERTYPropertyMortgageLoanInput alloc] init];
    propertyMortgageInput.monthlyMortgageAmount = [NSNumber numberWithInt:1];
    propertyMortgageInput.outstandingBalance = [NSNumber numberWithInt:1];
    
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    NSNumber *numberTen = [NSNumber numberWithInt:1];
    if([numberOne compare:propertyMortgageInput.monthlyMortgageAmount] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if([numberTen compare:propertyMortgageInput.outstandingBalance] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Updated balance to 1!");
    }
    
    
    //Invoke Put
    [[client propMortgageLoanPut:propertyMortgageInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        XCTAssertEqual(propertyMortgageInput.monthlyMortgageAmount, numberOne);
        XCTAssertEqual(propertyMortgageInput.outstandingBalance, numberOne);
    }];
}

- (void) testUpdatePropertyMaintenanceExpense {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMaintExpInput *propertyMaintInput = [[PROPERTYPropertyMaintExpInput alloc] init];
    propertyMaintInput.propertyId = [NSNumber numberWithInt:1];
    propertyMaintInput.ownerId = [NSNumber numberWithInt:1];
    
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:propertyMaintInput.propertyId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if([numberOne compare:propertyMaintInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    
    
    //Invoke Put
    [[client propMaintExpensePut:propertyMaintInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertEqual(propertyMaintInput.ownerId, numberOne);
        XCTAssertEqual(propertyMaintInput.propertyId, numberOne);
    }];
}

- (void) testUpdatePropertyGeneralExpense {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyGeneralExpInput *propertyGeneralInput = [[PROPERTYPropertyGeneralExpInput alloc] init];
    propertyGeneralInput.propertyId = [NSNumber numberWithInt:1];
    propertyGeneralInput.ownerId = [NSNumber numberWithInt:1];
    
    
    NSNumber *numberOne = [NSNumber numberWithInt:1];
    if([numberOne compare:propertyGeneralInput.propertyId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal");
    }
    if([numberOne compare:propertyGeneralInput.ownerId] == NSOrderedSame)
    {
        NSLog(@"Equal!");
    }
    else {
        NSLog(@"Not equal!");
    }
    
    
    //Invoke Put
    [[client generalExpensesPut:propertyGeneralInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertEqual(propertyGeneralInput.ownerId, numberOne);
        XCTAssertEqual(propertyGeneralInput.propertyId, numberOne);
    }];
}




@end


