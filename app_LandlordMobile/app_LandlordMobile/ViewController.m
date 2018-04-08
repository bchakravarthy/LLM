//
//  ViewController.m
//  app_LandlordMobile
//
//  Created by Nafisa Hasan on 4/3/18.
//  Copyright © 2018 Nafisa Hasan. All rights reserved.
//

#import "ViewController.h"
#import "PROPERTYPropertyMangementClient.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast2
                                                          identityPoolId:@"us-east-2:673767f7-1e5f-431b-9bb2-4cfd8c9b3466"];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast2 credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
    //[self insertExpenseType];
    //[self insertProperty];
    //[self insertPropertyMaintExp];
    //[self insertPropertyGeneralExp];
//    [self insertPropertyMortgageLoan];
    //[self insertPropertyOwner];
    //[self insertPropertyTax];
    //[self insertPurchaseDetails];
    //[self insertRentalAgreement];
    //[self insertTenantBackgroundCheck];
    //[self insertTenantIncomeExpenses];
    //[self insertTenantOccupation];
    //[self insertTenantReferences];
//    [self insertTenant];
    //[self getExpenseType];
    //[self getProperty]; //not working
    //[self getPropertyMaintExp];
    //[self getPropertyGeneralExp];
    //[self getPropertyMortgageLoan];
    //[self getPropertyOwner];
    //[self getPropertyTax];
    //[self getPurchaseDetails];
    //[self getRentalAgreement];
    //[self getTenantBackgroundCheck];
    //[self getTenantIncomeExpenses];
    //[self getTenantOccupation];
    //[self getTenantReferences];
    [self getTenant];
}

// MARK: Test cases for POST with hard code input value

//post for maint exp
- (void) insertExpenseType {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYMaintenanceExpTypeInput *input = [[PROPERTYMaintenanceExpTypeInput alloc] init];
    input.ownerId=[NSNumber numberWithInt:1];
    input._description=@"Test from Nafisa!";
    
    //Invoke POST on employee API
    [[client maintenanceExpensePost:input] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your maintenance expense type has been saved... Please check in the database...\n");
            
        }
        
        return nil;
    }];
}


//get for maint exp
- (void) getExpenseType {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Invoke GET on API
    [[client maintenanceExpenseGet] continueWithBlock:^id(AWSTask *task){
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
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

//post for properties
- (void) insertProperty {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyInput *propertyInput = [[PROPERTYPropertyInput alloc] init];
    
    propertyInput.ownerId=[NSNumber numberWithInt:1];
    propertyInput.addressLine1 = @"123 Lane Ave";
    propertyInput.addressLine2 = @"Test";
    propertyInput.city = @"Columbus";
    propertyInput.state = @"Ohio";
    propertyInput.zip = @"43201";
    propertyInput.countyOrDistrict = @"Franklin";
    propertyInput._description = @"Test";
    propertyInput.pictures = @"Test from Nafisa";
    
    //Invoke POST on employee API
    [[client propertiesPost:propertyInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property has been saved... Please check in the database...\n");
            
        }
        
        return nil;
    }];
}

//get for properties
- (void) getProperty {
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
            NSArray *arrData = result_var.output.properties;
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



//post for property maint exp
- (void) insertPropertyMaintExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMaintExpInput *propertyMaintInput = [[PROPERTYPropertyMaintExpInput alloc] init];
    
    propertyMaintInput.propertyId = [NSNumber numberWithInt:1];
    propertyMaintInput.ownerId = [NSNumber numberWithInt:1];
    propertyMaintInput.maintanenceExpenseId =[NSNumber numberWithInt:1];
    propertyMaintInput.expenseAmount = [NSNumber numberWithInt:1];
    propertyMaintInput.receiptCopy = @"Test from Nafisa";
    propertyMaintInput.receiptDate = @"Test from Nafisa";
   
    
    //Invoke POST on employee API
    [[client propMaintExpensePost:propertyMaintInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your property maintenance has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
}

//get for prop maint exp
- (void) getPropertyMaintExp  {
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




//post for property general exp
- (void) insertPropertyGeneralExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyGeneralExpInput *propertyGeneralInput = [[PROPERTYPropertyGeneralExpInput alloc] init];
    
    propertyGeneralInput.propertyId = [NSNumber numberWithInt:1];
    propertyGeneralInput.ownerId = [NSNumber numberWithInt:1];
    propertyGeneralInput.monthlyCondoFee = [NSNumber numberWithInt:1];
    propertyGeneralInput.monthlyHomeWarranty = [NSNumber numberWithInt:1];
    propertyGeneralInput.yearlyPropertyInsurance = [NSNumber numberWithInt:1];
    propertyGeneralInput.receiptCopy = @"Test from Nafisa";

    
    
    //Invoke POST on employee API
    [[client generalExpensesPost:propertyGeneralInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property general expense has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
}


//get for property general exp
- (void) getPropertyGeneralExp {
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

//post for property mortgage loan
- (void) insertPropertyMortgageLoan {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMortgageLoanInput *propertyMortgageInput = [[PROPERTYPropertyMortgageLoanInput alloc] init];
        propertyMortgageInput.propertyId = [NSNumber numberWithInt:1];
        propertyMortgageInput.ownerId = [NSNumber numberWithInt:1];
        propertyMortgageInput.mortgageLender = [NSNumber numberWithInt:1];
        propertyMortgageInput.monthlyMortgageAmount = [NSNumber numberWithInt:1];
        propertyMortgageInput.outstandingBalance = [NSNumber numberWithInt:10];
    
    
    
    //Invoke POST on employee API
    [[client propMortgageLoanPost:propertyMortgageInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your mortgage loan has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
}


//get for mortgage loan
- (void) getPropertyMortgageLoan {
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


//post for property owner
- (void) insertPropertyOwner {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyOwnerInput *propertyOwnerInput = [[PROPERTYPropertyOwnerInput alloc] init];
    propertyOwnerInput.ownerName = @"Nafisa";
    propertyOwnerInput.email = @"Nafisa@gmail.com";
    propertyOwnerInput.password = @"123secret";
    propertyOwnerInput.createdDate = @"040318";
    propertyOwnerInput.activatedYN = @"Today";
    propertyOwnerInput.profileMemo = @"memo";
    
    //Invoke POST on employee API
    [[client propOwnerPost:propertyOwnerInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property owner has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
}


//get for property owner
- (void) getPropertyOwner  {
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

//post for property tax
- (void) insertPropertyTax {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyTaxInput *propertyTaxInput = [[PROPERTYPropertyTaxInput alloc] init];
    propertyTaxInput.propertyId = [NSNumber numberWithInt:1];
    propertyTaxInput.ownerId = [NSNumber numberWithInt:1];
    propertyTaxInput.year = [NSNumber numberWithInt:1];
    propertyTaxInput.yearPaid = [NSNumber numberWithInt:1];
    propertyTaxInput.annualTax = [NSNumber numberWithInt:1];
    
    //Invoke POST on employee API
    [[client propTaxPost:propertyTaxInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
       
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property tax has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
}


//get for property tax
- (void) getPropertyTax {
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


//post for purchase details
- (void) insertPurchaseDetails {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPurchaseDetailsInput *purchaseInput = [[PROPERTYPurchaseDetailsInput alloc] init];
    purchaseInput.ownerId=[NSNumber numberWithInt:1];
    purchaseInput.propertyId=[NSNumber numberWithInt:1];
    purchaseInput.year=[NSNumber numberWithInt:2008];
    purchaseInput.price=[NSNumber numberWithInt:78500];
    
    //Invoke GET on employee API
    [[client purchaseDetailsPost:purchaseInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your purchase details have been saved... Please check in the database...\n");
            
        }
        
        return nil;
    }];
}

//get for purchase details
- (void) getPurchaseDetails {
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

//post for rental agreement
- (void) insertRentalAgreement {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYRentalAgreementInput *rentalAgreementInput = [[PROPERTYRentalAgreementInput alloc] init];
    rentalAgreementInput.ownerId=[NSNumber numberWithInt:1];
    rentalAgreementInput.tenantId=[NSNumber numberWithInt:1];
    rentalAgreementInput.numberOfOccupants=[NSNumber numberWithInt:2];
    rentalAgreementInput.monthlyRent=[NSNumber numberWithInt:500];
    rentalAgreementInput.monthlyRentDue = @"Today";
    rentalAgreementInput.startDate = @"Today";
    rentalAgreementInput.endDate = @"tomorrow";
    rentalAgreementInput.renewalOfFirstTerm = @"renewed";
    rentalAgreementInput.rentalAgreementCopy = @"copy";
    rentalAgreementInput.advance=[NSNumber numberWithInt:500];
    
    
    //Invoke GET on employee API
    [[client rentalAgreementPost:rentalAgreementInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your rental agreement has been saved... Please check in the database...\n");
            
        }
        
        return nil;
    }];
}

//get for rental agreement
- (void) getRentalAgreement {
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

//post background check
- (void) insertTenantBackgroundCheck {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantBackgroundInput *backgroundCheckInput = [[PROPERTYTenantBackgroundInput alloc] init];
    
    backgroundCheckInput.tenantId=[NSNumber numberWithInt:1];
    backgroundCheckInput.ownerId=[NSNumber numberWithInt:1];
    backgroundCheckInput.creditPassedYN=@"Y";
    backgroundCheckInput.criminalPassed=@"Yes";
    backgroundCheckInput.evictionPassedYN=@"No";
    backgroundCheckInput.recommendation=@"Tenant has clean credit";
    
    //Invoke POST on employee API
    [[client backgroundCheckPost:backgroundCheckInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant background check information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
}

//
//get for background check
- (void) getTenantBackgroundCheck {
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



//post income expenses
- (void) insertTenantIncomeExpenses {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantIncomeInput *tenantIncomeInput = [[PROPERTYTenantIncomeInput alloc] init];
    
    tenantIncomeInput.tenantId=[NSNumber numberWithInt:1];
    tenantIncomeInput.ownerId=[NSNumber numberWithInt:1];
    tenantIncomeInput.propertyOwnerId = [NSNumber numberWithInt:1];
    tenantIncomeInput.monthlyIncome=[NSNumber numberWithInt:1000];
    tenantIncomeInput.monthlyExpenses=[NSNumber numberWithInt:100];
    
    //Invoke POST on employee API
    [[client tenantsIncomeExpensePost:tenantIncomeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income expenses information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
}


//get for background check
- (void) getTenantIncomeExpenses {
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

//post tenant occupation
- (void) insertTenantOccupation {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantOccupationInput *tenantOccupationInput = [[PROPERTYTenantOccupationInput alloc] init];
    
    tenantOccupationInput.tenantId=[NSNumber numberWithInt:1];
    tenantOccupationInput.ownerId=[NSNumber numberWithInt:1];
    tenantOccupationInput.employer = @"Nafisa";
    tenantOccupationInput.title = @"Employee";
    
    //Invoke POST on employee API
    [[client tenantsOccupationPost:tenantOccupationInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income occupation information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
}


//get for tentant occupation
- (void) getTenantOccupation {
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

//post tenant reference
- (void) insertTenantReferences {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantRefInput *tenantRefInput = [[PROPERTYTenantRefInput alloc] init];
    
    tenantRefInput.tenantId=[NSNumber numberWithInt:1];
    tenantRefInput.ownerId=[NSNumber numberWithInt:1];
    tenantRefInput.firstName = @"Nafisa";
    tenantRefInput.lastName = @"Hasan";
    tenantRefInput.addressLine1 = @"123 Lane Ave";
    tenantRefInput.addressLine2 = @"Test";
    tenantRefInput.city = @"Columbus";
    tenantRefInput.state = @"Ohio";
    tenantRefInput.zip = @"43201";
    tenantRefInput.countyOrDistrict = @"Franklin";
    tenantRefInput.contactEmail = @"nafisa@gmail.com";
    tenantRefInput.contactPhone = @"6145551234";
    tenantRefInput.primaryContact = @"mom";
    
    
    //Invoke POST on employee API
    [[client tenantsReferencePost:tenantRefInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant reference information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
}

//get for tenant reference
- (void) getTenantReferences {
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



//post tenant
- (void) insertTenant {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantInput *tenantInput = [[PROPERTYTenantInput alloc] init];
    
    tenantInput.ownerId=[NSNumber numberWithInt:1];
    tenantInput.firstName = @"Nafisa";
    tenantInput.lastName = @"Hasan";
    tenantInput.middleName = @"Hasan2";
    tenantInput.age = [NSNumber numberWithInt:100];
    tenantInput.propertyId = [NSNumber numberWithInt:1];
    tenantInput.contactEmail = @"nafisa@gmail.com";
    tenantInput.contactPhone = @"6145661234";
    tenantInput.primaryContact = @"dad";
    
    
    //Invoke POST on employee API
    [[client tenantsPost:tenantInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
}



//get for tenant
- (void) getTenant {
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







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: Actions for creating new records
- (IBAction)addMaintExpTypeBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *OwnerId = self.addMaintExpTypeOwnerId.text;
    NSString *Descrp = self.addMaintExpTypeDescp.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYMaintenanceExpTypeInput *input = [[PROPERTYMaintenanceExpTypeInput alloc] init];
    input.ownerId = [f numberFromString:OwnerId];
    input._description = Descrp;
    
    //Invoke POST on employee API
    [[client maintenanceExpensePost:input] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your maintenance expense type has been saved... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.addMaintExpTypeDescp resignFirstResponder];
    
}

- (IBAction)addPropBtnPress:(id)sender {
    
    NSString *addrLine1 = self.addPropAddrLine1.text;
    NSString *addrLine2 = self.addPropAddrLine2.text;
    NSString *city = self.addPropCity.text;
    NSString *state = self.addPropState.text;
    NSString *zip = self.addPropZip.text;
    NSString *county = self.addPropCounty.text;
    NSString *descrip = self.addPropDescrp.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyInput *propertyInput = [[PROPERTYPropertyInput alloc] init];
    
    propertyInput.ownerId=[NSNumber numberWithInt:2018];
    propertyInput.addressLine1 = addrLine1;
    propertyInput.addressLine2 = addrLine2;
    propertyInput.city = city;
    propertyInput.state = state;
    propertyInput.zip = zip;
    propertyInput.countyOrDistrict = county;
    propertyInput._description = descrip;
    propertyInput.pictures = @"TODO";
    
    //Invoke POST on employee API
    [[client propertiesPost:propertyInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property has been saved... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.addPropCounty resignFirstResponder];
    
}

- (IBAction)addPurchaseDetailBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *OwnerId = self.addPurchaseDetailOwnerId.text;
    NSString *PropertyId = self.addPurchaseDetailPropId.text;
    NSString *Year = self.addPurchaseDetailYear.text;
    NSString *Price = self.addPurchaseDetailPrice.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPurchaseDetailsInput *purchaseInput = [[PROPERTYPurchaseDetailsInput alloc] init];
    purchaseInput.ownerId = [f numberFromString:OwnerId];
    purchaseInput.propertyId = [f numberFromString:PropertyId];
    purchaseInput.year = [f numberFromString:Year];
    purchaseInput.price = [f numberFromString:Price];
    
    //Invoke GET on employee API
    [[client purchaseDetailsPost:purchaseInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your purchase details have been saved... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.addPurchaseDetailPrice resignFirstResponder];
    
}

- (IBAction)addPropMaintExpBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *PropertyId = self.addPropMaintExpPropId.text;
    NSString *OwnerId = self.addPropMaintExpOwnerId.text;
    NSString *ExpenseId = self.addPropMaintExpExpId.text;
    NSString *ExpenseAmt = self.addPropMaintExpExpAmt.text;
    NSString *ReceiptDate = self.addPropMaintExpReceiptDate.text;
    NSString *ReceiptCopy = self.addPropMaintExpReceiptCopy.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMaintExpInput *propertyMaintInput = [[PROPERTYPropertyMaintExpInput alloc] init];
    
    propertyMaintInput.propertyId = [f numberFromString:PropertyId];
    propertyMaintInput.ownerId = [f numberFromString:OwnerId];
    propertyMaintInput.maintanenceExpenseId = [f numberFromString:ExpenseId];
    propertyMaintInput.expenseAmount = [f numberFromString:ExpenseAmt];
    propertyMaintInput.receiptCopy = ReceiptCopy;
    propertyMaintInput.receiptDate = ReceiptDate;
    
    
    //Invoke POST on employee API
    [[client propMaintExpensePost:propertyMaintInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your property maintenance has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.addPropMaintExpReceiptCopy resignFirstResponder];
    
}


- (IBAction)addPropOwnerBtnPress:(id)sender {
    
    NSString *OwnerName = self.addPropOwnerName.text;
    NSString *Password = self.addPropOwnerPassword.text;
    NSString *ConfirmPassword = self.addPropOwnerConfirmPassword.text;
    NSString *Date = self.addPropOwnerDate.text;
    NSString *Email = self.addPropOwnerEmail.text;
    NSString *Activated = self.addPropOwnerActivated.text;
    NSString *Propfile = self.addPropOwnerProfile.text;
    
    if (ConfirmPassword == Password) {
        //Instantiate client object
        PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
        
        //Assign input values to be sent to Dynamo DB via API call
        PROPERTYPropertyOwnerInput *propertyOwnerInput = [[PROPERTYPropertyOwnerInput alloc] init];
        propertyOwnerInput.ownerName = OwnerName;
        propertyOwnerInput.email = Email;
        propertyOwnerInput.password = ConfirmPassword;
        propertyOwnerInput.createdDate = Date;
        propertyOwnerInput.activatedYN = Activated;
        propertyOwnerInput.profileMemo = Propfile;
        
        //Invoke POST on employee API
        [[client propOwnerPost:propertyOwnerInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
            
            if (task.error) {
                NSLog(@"Error: %@", task.error);
                return nil;
            }
            
            if (task.result) {
                
                //You are here, so method invocation is a success
                
                printf("Success....\n");
                
                NSLog(@"Return from API call. Your property owner has been saved. Please check in the database.\n");
                
            }
            
            return nil;
        }];
    } else {
        printf("Your password don't match with the conformed password. Try again.");
    }
    
    [self.addPropOwnerProfile resignFirstResponder];
    
}

- (IBAction)addTenantOccupBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *TenantId = self.addTenantOccupTenantId.text;
    NSString *OwnerId = self.addTenantOccupOwnerId.text;
    NSString *Employer = self.addTenantEmployer.text;
    NSString *Title = self.addTenantOccupTitle.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantOccupationInput *tenantOccupationInput = [[PROPERTYTenantOccupationInput alloc] init];
    
    tenantOccupationInput.tenantId = [f numberFromString:TenantId];
    tenantOccupationInput.ownerId = [f numberFromString:OwnerId];
    tenantOccupationInput.employer = Employer;
    tenantOccupationInput.title = Title;
    
    //Invoke POST on employee API
    [[client tenantsOccupationPost:tenantOccupationInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income occupation information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.addTenantOccupTitle resignFirstResponder];
    
}

- (IBAction)addPropTaxBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *PropertyId = self.addPropTaxPropId.text;
    NSString *OwnerId = self.addPropTaxOwnerId.text;
    NSString *Year  = self.addPropTaxYear.text;
    NSString *YearPaid = self.addPropTaxYearPaid.text;
    NSString *AnnualTax = self.addPropTaxAnnualTax.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyTaxInput *propertyTaxInput = [[PROPERTYPropertyTaxInput alloc] init];
    propertyTaxInput.propertyId = [f numberFromString:PropertyId];
    propertyTaxInput.ownerId = [f numberFromString:OwnerId];
    propertyTaxInput.year = [f numberFromString:Year];
    propertyTaxInput.yearPaid = [f numberFromString:YearPaid];
    propertyTaxInput.annualTax = [f numberFromString:AnnualTax];
    
    //Invoke POST on employee API
    [[client propTaxPost:propertyTaxInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property tax has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.addPropTaxYearPaid resignFirstResponder];
    
}


- (IBAction)addPropGenExpBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *PropertyId = self.addPropGenExpPropId.text;
    NSString *OwnerId = self.addPropGenExpOwnerId.text;
    NSString *MonthlyFee = self.addPropGenExpMonthlyFee.text;
    NSString *MonthlyWarranty = self.addPropGenExpWarranty.text;
    NSString *YearlyInsurance = self.addPropGenExpYearlyIns.text;
    NSString *ReceiptCopy = self.addPropGenExpDescrip.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyGeneralExpInput *propertyGeneralInput = [[PROPERTYPropertyGeneralExpInput alloc] init];
    
    propertyGeneralInput.propertyId = [f numberFromString:PropertyId];
    propertyGeneralInput.ownerId = [f numberFromString:OwnerId];
    propertyGeneralInput.monthlyCondoFee = [f numberFromString:MonthlyFee];
    propertyGeneralInput.monthlyHomeWarranty = [f numberFromString:MonthlyWarranty];
    propertyGeneralInput.yearlyPropertyInsurance = [f numberFromString:YearlyInsurance];
    propertyGeneralInput.receiptCopy = ReceiptCopy;
    
    
    
    //Invoke POST on employee API
    [[client generalExpensesPost:propertyGeneralInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property general expense has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.addPropGenExpDescrip resignFirstResponder];
    
}


- (IBAction)addTenantBgCheckBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *TenantId = self.addTenantBgCheckTenantId.text;
    NSString *OwnerId = self.addTenantBgCheckOwnerId.text;
    NSString *Credit = self.addTenantBgCheckCreditPass.text;
    NSString *Criminal = self.addTenantBgCheckCriminalPass.text;
    NSString *Eviction = self.addTenantBgCheckEviction.text;
    NSString *Recommendation = self.addTenantBgCheckRec.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantBackgroundInput *backgroundCheckInput = [[PROPERTYTenantBackgroundInput alloc] init];
    
    backgroundCheckInput.tenantId=[f numberFromString:TenantId];
    backgroundCheckInput.ownerId=[f numberFromString:OwnerId];
    backgroundCheckInput.creditPassedYN=Credit;
    backgroundCheckInput.criminalPassed=Criminal;
    backgroundCheckInput.evictionPassedYN=Eviction;
    backgroundCheckInput.recommendation=Recommendation;
    
    //Invoke POST on employee API
    [[client backgroundCheckPost:backgroundCheckInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant background check information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.addTenantBgCheckRec resignFirstResponder];
    
}


- (IBAction)addPropMortLoanBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *PropertyId = self.addPropMortLoanPropId.text;
    NSString *OwnerId = self.addPropMortLoanOwnerId.text;
    NSString *Lender = self.addPropMortLoanLender.text;
    NSString *Amount = self.addPropMortLoanMonthAmt.text;
    NSString *Balance = self.addPropMortLoanBalance.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMortgageLoanInput *propertyMortgageInput = [[PROPERTYPropertyMortgageLoanInput alloc] init];
    propertyMortgageInput.propertyId = [f numberFromString:PropertyId];
    propertyMortgageInput.ownerId = [f numberFromString:OwnerId];
    propertyMortgageInput.mortgageLender = [f numberFromString:Lender];
    propertyMortgageInput.monthlyMortgageAmount = [f numberFromString:Amount];
    propertyMortgageInput.outstandingBalance = [f numberFromString:Balance];
    
    
    //Invoke POST on employee API
    [[client propMortgageLoanPost:propertyMortgageInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your mortgage loan has been saved. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.addPropMortLoanBalance resignFirstResponder];
    
}


- (IBAction)addTenantIncomeExpBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *TenantId = self.addTenantIncomeExpTenantId.text;
    NSString *OwnerId = self.addTenantIncomeExpOwnerId.text;
    NSString *MonthlyIncome = self.addTenantIncomeExpMonthlyIncome.text;
    NSString *MonthlyExp = self.addTenantIncomeExpMonthlyExp.text;
    NSString *PropOwnerId = self.addTenantIncomeExpPropOwnerId.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantIncomeInput *tenantIncomeInput = [[PROPERTYTenantIncomeInput alloc] init];
    
    tenantIncomeInput.tenantId = [f numberFromString:TenantId];
    tenantIncomeInput.ownerId = [f numberFromString:OwnerId];
    tenantIncomeInput.propertyOwnerId = [f numberFromString:PropOwnerId];
    tenantIncomeInput.monthlyIncome = [f numberFromString:MonthlyIncome];
    tenantIncomeInput.monthlyExpenses = [f numberFromString:MonthlyExp];
    
    //Invoke POST on employee API
    [[client tenantsIncomeExpensePost:tenantIncomeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income expenses information has been saved. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.addTenantIncomeExpMonthlyExp resignFirstResponder];
    
}


// MARK: Actions for getting list of records



// MARK: Actions for updating existing records




@end
