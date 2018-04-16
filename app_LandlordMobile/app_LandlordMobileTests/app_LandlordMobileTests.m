//
//  app_LandlordMobileTests.m
//  app_LandlordMobileTests
//
//  Created by Nafisa Hasan on 4/15/18.
//  Copyright © 2018 Nafisa Hasan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PROPERTYPropertyMangementClient.h"
#import "PROPERTYMaintenanceExpTypeOutput_maintenance_expense_types_item.h"


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


//POST tests
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




//GET tests
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


//PUT tests
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



@end

