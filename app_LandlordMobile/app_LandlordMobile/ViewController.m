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
    
//    [self insertExpenseType];
//    [self insertProperty];
//    [self insertPropertyMaintExp];
//    [self insertPropertyGeneralExp];
//    [self insertPropertyMortgageLoan];
//    [self insertPropertyOwner];
//    [self insertPropertyTax];
//    [self insertPurchaseDetails];
//    [self insertRentalAgreement];
//    [self insertTenantBackgroundCheck];
//    [self insertTenantIncomeExpenses];
//    [self insertTenantOccupation];
//    [self insertTenantReferences];
//    [self insertTenant];
//    [self getExpenseType];
    
//    [self getExpenseType];
//    [self getProperty];
//    [self getPropertyMaintExp];
//    [self getPropertyGeneralExp];
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
    propertyInput.propState = @"Ohio";
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


//post for property maint exp
- (void) insertPropertyMaintExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMaintExpInput *propertyMaintInput = [[PROPERTYPropertyMaintExpInput alloc] init];
    
    propertyMaintInput.propertyId = [NSNumber numberWithInt:1];
    propertyMaintInput.ownerId = [NSNumber numberWithInt:1];
    propertyMaintInput.maintenanceExpenseId =[NSNumber numberWithInt:1];
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

//post for property tax
- (void) insertPropertyTax {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyTaxInput *propertyTaxInput = [[PROPERTYPropertyTaxInput alloc] init];
    propertyTaxInput.propertyId = [NSNumber numberWithInt:1];
    propertyTaxInput.ownerId = [NSNumber numberWithInt:1];
    propertyTaxInput.yearOwed = [NSNumber numberWithInt:1];
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

//post for purchase details
- (void) insertPurchaseDetails {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPurchaseDetailsInput *purchaseInput = [[PROPERTYPurchaseDetailsInput alloc] init];
    purchaseInput.ownerId=[NSNumber numberWithInt:1];
    purchaseInput.propertyId=[NSNumber numberWithInt:1];
    purchaseInput.yearOfPurchase=[NSNumber numberWithInt:2008];
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

//post for renal agreement
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
    tenantRefInput.tenantState = @"Ohio";
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// MARK: Test cases for GET
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


// MARK: Test cases for PUT

- (void) updateTenantOccupation{
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantOccupationInput *tenantOccupationInput = [[PROPERTYTenantOccupationInput alloc] init];
    
    tenantOccupationInput.tenantOccupationId=[NSNumber numberWithInt:4];
    tenantOccupationInput.tenantId=[NSNumber numberWithInt:6];
    tenantOccupationInput.ownerId=[NSNumber numberWithInt:8];
    tenantOccupationInput.employer = @"Nafisa";
    tenantOccupationInput.title = @"Employee";
    
    //Invoke PUT on employee API
    [[client tenantsOccupationPut:tenantOccupationInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income occupation information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
}

- (void) updateProperty {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyInput *propertyInput = [[PROPERTYPropertyInput alloc] init];
    
    propertyInput.propertyId =[NSNumber numberWithInt:1];
    propertyInput.ownerId=[NSNumber numberWithInt:3];
    propertyInput.addressLine1 = @"87 Summit ST";
    propertyInput.addressLine2 = @"Apartment C";
    propertyInput.city = @"Columbus";
    propertyInput.propState = @"OH";
    propertyInput.zip = @"43201";
    propertyInput.countyOrDistrict = @"Franklin";
    propertyInput._description = @"Test2";
    propertyInput.pictures = @"Test from Xcode";
    
    //Invoke PUT on employee API
    [[client propertiesPut:propertyInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property has been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
}

// Update tenant reference
- (void) updateTenantReference {
    
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantRefInput *tenantRefInput = [[PROPERTYTenantRefInput alloc] init];
    
    tenantRefInput.tenantReferenceId = [NSNumber numberWithInt:1];
    tenantRefInput.tenantId=[NSNumber numberWithInt:1];
    tenantRefInput.ownerId=[NSNumber numberWithInt:1];
    tenantRefInput.firstName = @"Yaman";
    tenantRefInput.lastName = @"Smith";
    tenantRefInput.addressLine1 = @"123 Lane Ave";
    tenantRefInput.addressLine2 = @"Test";
    tenantRefInput.city = @"Columbus";
    tenantRefInput.tenantState = @"indiana";
    tenantRefInput.zip = @"43201";
    tenantRefInput.countyOrDistrict = @"Franklin";
    tenantRefInput.contactEmail = @"nafisa@gmail.com";
    tenantRefInput.contactPhone = @"6145551234";
    tenantRefInput.primaryContact = @"mom";
    
    
    //Invoke Put on employee API
    [[client tenantsReferencePut:tenantRefInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant reference information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
}

// Update tenant
- (void) updateTenant {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantInput *tenantInput = [[PROPERTYTenantInput alloc] init];
    
    tenantInput.tenantId = [NSNumber numberWithInt:1];
    tenantInput.ownerId=[NSNumber numberWithInt:20];
    tenantInput.firstName = @"Kiki";
    tenantInput.lastName = @"Jin";
    tenantInput.middleName = @"None";
    tenantInput.age = [NSNumber numberWithInt:21];
    tenantInput.propertyId = [NSNumber numberWithInt:1];
    tenantInput.contactEmail = @"Kiki@gmail.com";
    tenantInput.contactPhone = @"6145661234";
    tenantInput.primaryContact = @"dad";
    
    
    //Invoke PUT on employee API
    [[client tenantsPut:tenantInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    
}

- (void) updateTenantIncomeExpenses {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantIncomeInput *tenantIncomeInput = [[PROPERTYTenantIncomeInput alloc] init];
    
    tenantIncomeInput.tenantIncomeExpenseId = [NSNumber numberWithInt:2];
    tenantIncomeInput.tenantId=[NSNumber numberWithInt:1];
    tenantIncomeInput.ownerId=[NSNumber numberWithInt:1];
    tenantIncomeInput.propertyOwnerId = [NSNumber numberWithInt:1];
    tenantIncomeInput.monthlyIncome=[NSNumber numberWithInt:1];
    tenantIncomeInput.monthlyExpenses=[NSNumber numberWithInt:1];
    
    //Invoke PUT on employee API
    [[client tenantsIncomeExpensePut:tenantIncomeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income expenses information has been update. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
}

// update tenant background check
- (void) updateTenantBackgroundCheck {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantBackgroundInput *backgroundCheckInput = [[PROPERTYTenantBackgroundInput alloc] init];
    
    backgroundCheckInput.tenantBackgroundCheckId=[NSNumber numberWithInt:1];
    backgroundCheckInput.tenantId=[NSNumber numberWithInt:1];
    backgroundCheckInput.ownerId=[NSNumber numberWithInt:1];
    backgroundCheckInput.creditPassedYN=@"N";
    backgroundCheckInput.criminalPassed=@"No";
    backgroundCheckInput.evictionPassedYN=@"N";
    backgroundCheckInput.recommendation=@"Tenant has Bad credit";
    
    //Invoke PUT on employee API
    [[client backgroundCheckPut:backgroundCheckInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant background check information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
}

// update rental agreement
- (void) updateRentalAgreement {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYRentalAgreementInput *rentalAgreementInput = [[PROPERTYRentalAgreementInput alloc] init];
    
    rentalAgreementInput.rentalAgreementId = [NSNumber numberWithInt:1];
    rentalAgreementInput.ownerId=[NSNumber numberWithInt:1];
    rentalAgreementInput.tenantId=[NSNumber numberWithInt:1];
    rentalAgreementInput.numberOfOccupants=[NSNumber numberWithInt:6];
    rentalAgreementInput.monthlyRent=[NSNumber numberWithInt:1];
    rentalAgreementInput.monthlyRentDue = @"Today";
    rentalAgreementInput.startDate = @"Today";
    rentalAgreementInput.endDate = @"tomorrow";
    rentalAgreementInput.renewalOfFirstTerm = @"renewed";
    rentalAgreementInput.rentalAgreementCopy = @"copy";
    rentalAgreementInput.advance=[NSNumber numberWithInt:500];
    
    
    //Invoke PUT on employee API
    [[client rentalAgreementPut:rentalAgreementInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your rental agreement has been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
}

// update purchase details
- (void) updatePurchaseDetails {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPurchaseDetailsInput *purchaseInput = [[PROPERTYPurchaseDetailsInput alloc] init];
    
    purchaseInput.purchaseId=[NSNumber numberWithInt:1];
    purchaseInput.ownerId=[NSNumber numberWithInt:1];
    purchaseInput.propertyId=[NSNumber numberWithInt:1];
    purchaseInput.yearOfPurchase=[NSNumber numberWithInt:2000];
    purchaseInput.price=[NSNumber numberWithInt:78500];
    
    //Invoke PUT on employee API
    [[client purchaseDetailsPut:purchaseInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your purchase details have been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    
}

// update property tax
- (void) updatePropertyTax {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyTaxInput *propertyTaxInput = [[PROPERTYPropertyTaxInput alloc] init];
    
    propertyTaxInput.propertyTaxId = [NSNumber numberWithInt:1];
    propertyTaxInput.propertyId = [NSNumber numberWithInt:1];
    propertyTaxInput.ownerId = [NSNumber numberWithInt:1];
    propertyTaxInput.yearOwed = [NSNumber numberWithInt:1];
    propertyTaxInput.yearPaid = [NSNumber numberWithInt:1];
    propertyTaxInput.annualTax = [NSNumber numberWithInt:1];
    
    //Invoke PUT on employee API
    [[client propTaxPut:propertyTaxInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property tax has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
}

// update property owner
- (void) updatePropertyOwner {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyOwnerInput *propertyOwnerInput = [[PROPERTYPropertyOwnerInput alloc] init];
    
    propertyOwnerInput.ownerId = [NSNumber numberWithInt:1];
    propertyOwnerInput.ownerName = @"Yaman";
    propertyOwnerInput.email = @"Yaman@gmail.com";
    propertyOwnerInput.password = @"123secret";
    propertyOwnerInput.createdDate = @"040318";
    propertyOwnerInput.activatedYN = @"Today";
    propertyOwnerInput.profileMemo = @"memo";
    
    //Invoke PUT on employee API
    [[client propOwnerPut:propertyOwnerInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property owner has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
}

// update property mortgage loan
- (void) updatePropertyMortgageLoan {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMortgageLoanInput *propertyMortgageInput = [[PROPERTYPropertyMortgageLoanInput alloc] init];
    
    propertyMortgageInput.propertyMortgageLoanId = [NSNumber numberWithInt:1];
    propertyMortgageInput.propertyId = [NSNumber numberWithInt:1];
    propertyMortgageInput.ownerId = [NSNumber numberWithInt:1];
    propertyMortgageInput.mortgageLender = [NSNumber numberWithInt:1];
    propertyMortgageInput.monthlyMortgageAmount = [NSNumber numberWithInt:1];
    propertyMortgageInput.outstandingBalance = [NSNumber numberWithInt:1];
    
    
    
    //Invoke POST on employee API
    [[client propMortgageLoanPut:propertyMortgageInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your mortgage loan has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
}

// update Property Maintenance Expense
- (void) updatePropertyMaintenanceExpense {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMaintExpInput *propertyMaintInput = [[PROPERTYPropertyMaintExpInput alloc] init];
    
    propertyMaintInput.propertyMaintanenceExpenseId = [NSNumber numberWithInt:1];
    propertyMaintInput.propertyId = [NSNumber numberWithInt:1];
    propertyMaintInput.ownerId = [NSNumber numberWithInt:1];
    propertyMaintInput.maintenanceExpenseId =[NSNumber numberWithInt:1];
    propertyMaintInput.expenseAmount = [NSNumber numberWithInt:1];
    propertyMaintInput.receiptCopy = @"Test from Yaman";
    propertyMaintInput.receiptDate = @"Test from Yaman";
    
    
    //Invoke PUT on employee API
    [[client propMaintExpensePut:propertyMaintInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your property maintenance has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
}

// update property general expense
- (void) updatePropertyGeneralExpense {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyGeneralExpInput *propertyGeneralInput = [[PROPERTYPropertyGeneralExpInput alloc] init];
    
    
    propertyGeneralInput.propertyGeneralExpenseId = [NSNumber numberWithInt:1];
    propertyGeneralInput.propertyId = [NSNumber numberWithInt:1];
    propertyGeneralInput.ownerId = [NSNumber numberWithInt:1];
    propertyGeneralInput.monthlyCondoFee = [NSNumber numberWithInt:1];
    propertyGeneralInput.monthlyHomeWarranty = [NSNumber numberWithInt:1];
    propertyGeneralInput.yearlyPropertyInsurance = [NSNumber numberWithInt:1];
    propertyGeneralInput.receiptCopy = @"Test from Yaman";
    
    
    
    //Invoke PUT on employee API
    [[client generalExpensesPut:propertyGeneralInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property general expense has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
}

// update maintenance expense type
- (void) updateMaintenanceExpenseType {
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYMaintenanceExpTypeInput *MaintenanceExpenseTypeInput = [[PROPERTYMaintenanceExpTypeInput alloc] init];
    
    MaintenanceExpenseTypeInput.maintenanceExpenseId = [NSNumber numberWithInteger:1];
    MaintenanceExpenseTypeInput.ownerId=[NSNumber numberWithInt:1];
    MaintenanceExpenseTypeInput._description = @"New Coaches";
    
    //Invoke Put on employee API
    [[client maintenanceExpensePut:MaintenanceExpenseTypeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your maintenance expense type has been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
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
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *OwnerId = self.addPropOwnerId.text;
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
    
    propertyInput.ownerId=[f numberFromString:OwnerId];
    propertyInput.addressLine1 = addrLine1;
    propertyInput.addressLine2 = addrLine2;
    propertyInput.city = city;
    propertyInput.propState = state;
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
    purchaseInput.yearOfPurchase = [f numberFromString:Year];
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
    propertyMaintInput.maintenanceExpenseId = [f numberFromString:ExpenseId];
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
    propertyTaxInput.yearOwed = [f numberFromString:Year];
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


// Not working, something is wrong with the test field AddrLine1
- (IBAction)addTenantRefBrnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *TenantId = self.addTenantRefTenantId.text;
    NSString *OwnerId = self.updateTenantRefOwnerId.text;
    NSString *FirstN = self.updateTenantRefFirstN.text;
    NSString *LastN = self.updateTenantRefLastN.text;
    NSString *Addr1 = self.updateTenantRefAddr1.text;
    NSString *Addr2 = self.updateTenantRefAddr2.text;
    NSString *City = self.updateTenantRefCity.text;
    NSString *State = self.updateTenantRefState.text;
    NSString *Zip = self.updateTenantRefZip.text;
    NSString *County = self.updateTenantRefZip.text;
    NSString *Email = self.updateTenantRefEmail.text;
    NSString *Phone = self.updateTenantRefPhone.text;
    NSString *Primary = self.updateTenantRefPrimary.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantRefInput *tenantRefInput = [[PROPERTYTenantRefInput alloc] init];
    
    tenantRefInput.tenantId=[f numberFromString:TenantId];
    tenantRefInput.ownerId=[f numberFromString:OwnerId];
    tenantRefInput.firstName = FirstN;
    tenantRefInput.lastName = LastN;
    tenantRefInput.addressLine1 = Addr1;
    tenantRefInput.addressLine2 = Addr2;
    tenantRefInput.city = City;
    tenantRefInput.tenantState = State;
    tenantRefInput.zip = Zip;
    tenantRefInput.countyOrDistrict = County;
    tenantRefInput.contactEmail = Email;
    tenantRefInput.contactPhone = Phone;
    tenantRefInput.primaryContact = Primary;
    
    
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


- (IBAction)addRentalAgreementBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *OwnerId = self.addRentalAgreeOwnerid.text;
    NSString *TenantId = self.addRentalAgreeTenantid.text;
    NSString *NumOfOcc = self.addRentalAgreeNumOfOcc.text;
    NSString *MonthRent = self.addRentalAgreeMonthRent.text;
    NSString *RentDue = self.addRentalAgreeRentDue.text;
    NSString *StartDate  = self.addRentalAgreeStartDate.text;
    NSString *EndDate  = self.addRentalAgreeEndDate.text;
    NSString *Renew = self.addRentalAgreeRenew.text;
    NSString *Copy = self.addRentalAgreeCopy.text;
    NSString *Advance = self.addRentalAgreeAdvance.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYRentalAgreementInput *rentalAgreementInput = [[PROPERTYRentalAgreementInput alloc] init];
    rentalAgreementInput.ownerId = [f numberFromString:OwnerId];
    rentalAgreementInput.tenantId = [f numberFromString:TenantId];
    rentalAgreementInput.numberOfOccupants = [f numberFromString:NumOfOcc];
    rentalAgreementInput.monthlyRent = [f numberFromString:MonthRent];
    rentalAgreementInput.monthlyRentDue = RentDue;
    rentalAgreementInput.startDate = StartDate;
    rentalAgreementInput.endDate = EndDate;
    rentalAgreementInput.renewalOfFirstTerm = Renew;
    rentalAgreementInput.rentalAgreementCopy = Copy;
    rentalAgreementInput.advance = [f numberFromString:Advance];
    
    
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
    
    [self.addRentalAgreeCopy resignFirstResponder];
    
}


- (IBAction)addTenantBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *OwnerId = self.addTenantOwnerId.text;
    NSString *PropertyId = self.addTenantPropertyId.text;
    NSString *FirstName = self.addTenantFirstName.text;
    NSString *MiddleName = self.addTenantMiddleName.text;
    NSString *LastName = self.addTenantLastName.text;
    NSString *Age = self.addTenantAge.text;
    NSString *ContactEmail = self.addTenantContactEmail.text;
    NSString *ContactPhone = self.addTenantContactPhone.text;
    NSString *PrimaryContact = self.addTenantPrimaryContact.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantInput *tenantInput = [[PROPERTYTenantInput alloc] init];
    
    tenantInput.ownerId = [f numberFromString:OwnerId];
    tenantInput.firstName = FirstName;
    tenantInput.lastName = LastName;
    tenantInput.middleName = MiddleName;
    tenantInput.age = [f numberFromString:Age];
    tenantInput.propertyId = [f numberFromString:PropertyId];
    tenantInput.contactEmail = ContactEmail;
    tenantInput.contactPhone = ContactPhone;
    tenantInput.primaryContact = PrimaryContact;
    
    
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
    
    [self.addTenantPrimaryContact resignFirstResponder];
    
}


// MARK: Actions for getting list of records
- (IBAction)getMaintExpTypeBtnPress:(id)sender {
    
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYMaintenanceExpTypeResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.maintenanceExpenseTypes;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of maintenance expenses %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];

            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Maintenance Expense ID: %@\n", ((PROPERTYMaintenanceExpTypeOutput_maintenance_expense_types_item *)element).maintenanceExpenseId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYMaintenanceExpTypeOutput_maintenance_expense_types_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Description: %@\n", ((PROPERTYMaintenanceExpTypeOutput_maintenance_expense_types_item *)element)._description];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
            }
            
            [self.getMaintExpTypeList setText:InfoWithCount];
            
        }
        return nil;
    }];

}



- (IBAction)getPropBtnPress:(id)sender {
    
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYPropertyResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.ownerProperties;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of properties %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Property ID: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).propertyId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Description: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element)._description];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Address Line 1: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).addressLine1];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Address Line 2: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).addressLine2];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"City: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).city];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
                NSString *recordSeven = [NSString stringWithFormat:@"State: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).propState];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSeven];
                NSString *recordEight = [NSString stringWithFormat:@"Zip: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).zip];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordEight];
                NSString *recordNine = [NSString stringWithFormat:@"County: %@\n", ((PROPERTYPropertyOutput_owner_properties_item *)element).countyOrDistrict];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordNine];            
            }
            
            [self.getPropList setText:InfoWithCount];
            
        }
        return nil;
    }];
    
}


- (IBAction)getTenantBtnPress:(id)sender {
    
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYTenantResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenants;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of tenants %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Tenant ID: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).tenantId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Propperty ID: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).propertyId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"First name: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).firstName];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Middle name: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).middleName];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Last name: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).lastName];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
                NSString *recordSeven = [NSString stringWithFormat:@"Age: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).age];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSeven];
                NSString *recordEight = [NSString stringWithFormat:@"Contact email: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).contactEmail];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordEight];
                NSString *recordNine = [NSString stringWithFormat:@"Contact phone: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).contactPhone];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordNine];
                NSString *recordTen = [NSString stringWithFormat:@"Primary contact: %@\n", ((PROPERTYTenantOutput_tenants_item *)element).primaryContact];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTen];
            }
            [self.getTenantList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getPurchaseDetailBtnPress:(id)sender {
    
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYPurchaseDetailsResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.purchaseDetails;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of purchase details %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Purchase ID: %@\n", ((PROPERTYPurchaseDetailsOutput_purchase_details_item *)element).purchaseId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYPurchaseDetailsOutput_purchase_details_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Property ID: %@\n", ((PROPERTYPurchaseDetailsOutput_purchase_details_item *)element).propertyId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Year: %@\n", ((PROPERTYPurchaseDetailsOutput_purchase_details_item *)element).yearOfPurchase];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Price: %@\n", ((PROPERTYPurchaseDetailsOutput_purchase_details_item *)element).price];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
            }
            [self.getPurchaseDetailList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getPropMaintExpBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYPropertyMaintExpResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyMaintenanceExpenses;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of property maintenance expenses %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Property Maintenance Expense ID: %@\n", ((PROPERTYPropertyMaintExpOutput_property_maintenance_expenses_item *)element).propertyMaintanenceExpenseId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Propperty ID: %@\n", ((PROPERTYPropertyMaintExpOutput_property_maintenance_expenses_item *)element).propertyId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYPropertyMaintExpOutput_property_maintenance_expenses_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Maintenance Expense ID: %@\n", ((PROPERTYPropertyMaintExpOutput_property_maintenance_expenses_item *)element).maintanenceExpenseId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Expense amout: %@\n", ((PROPERTYPropertyMaintExpOutput_property_maintenance_expenses_item *)element).expenseAmount];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Receipt date: %@\n", ((PROPERTYPropertyMaintExpOutput_property_maintenance_expenses_item *)element).receiptDate];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
                NSString *recordSeven = [NSString stringWithFormat:@"Receipt Copy: %@\n", ((PROPERTYPropertyMaintExpOutput_property_maintenance_expenses_item *)element).receiptCopy];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSeven];
            }
            [self.getPropMaintExpList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getPropTaxBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYPropertyTaxResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyTax;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of property tax %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Property Tax ID: %@\n", ((PROPERTYPropertyTaxOutput_property_tax_item *)element).propertyTaxId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Propperty ID: %@\n", ((PROPERTYPropertyTaxOutput_property_tax_item *)element).propertyId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYPropertyTaxOutput_property_tax_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Year: %@\n", ((PROPERTYPropertyTaxOutput_property_tax_item *)element).yearOwed];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Year paid: %@\n", ((PROPERTYPropertyTaxOutput_property_tax_item *)element).yearPaid];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Annual tax: %@\n", ((PROPERTYPropertyTaxOutput_property_tax_item *)element).annualTax];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
            }
            [self.getPropTaxList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getTenantBgCheckBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYTenantBackgroundResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantBackgroundCheck;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of tenant background check %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Tenant background check ID: %@\n", ((PROPERTYTenantBackgroundOutput_tenant_background_check_item *)element).tenantBackgroundCheckId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Tenant ID: %@\n", ((PROPERTYTenantBackgroundOutput_tenant_background_check_item *)element).tenantId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYTenantBackgroundOutput_tenant_background_check_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Criminal passed: %@\n", ((PROPERTYTenantBackgroundOutput_tenant_background_check_item *)element).criminalPassed];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Credit passed: %@\n", ((PROPERTYTenantBackgroundOutput_tenant_background_check_item *)element).creditPassedYN];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Eviction passed: %@\n", ((PROPERTYTenantBackgroundOutput_tenant_background_check_item *)element).evictionPassedYN];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
                NSString *recordSeven = [NSString stringWithFormat:@"Recommendation: %@\n", ((PROPERTYTenantBackgroundOutput_tenant_background_check_item *)element).recommendation];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSeven];
            }
            [self.getTenantBgCheckList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getTenantIncExpBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYTenantIncomeResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantIncomeExpense;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of tenant income expense %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Tenant income expense ID: %@\n", ((PROPERTYTenantIncomeOutput_tenant_income_expense_item *)element).tenantIncomeExpenseId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Tenant ID: %@\n", ((PROPERTYTenantIncomeOutput_tenant_income_expense_item *)element).tenantId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYTenantIncomeOutput_tenant_income_expense_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Monthly income: %@\n", ((PROPERTYTenantIncomeOutput_tenant_income_expense_item *)element).monthlyIncome];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Monthly expense: %@\n", ((PROPERTYTenantIncomeOutput_tenant_income_expense_item *)element).monthlyExpenses];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Property owner owner ID: %@\n", ((PROPERTYTenantIncomeOutput_tenant_income_expense_item *)element).propertyOwnerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
            }
            [self.getTenantIncomeExpList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getTenantOccBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYTenantOccupationResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantOccupation;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of tenant occupation %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Tenant occupation ID: %@\n", ((PROPERTYTenantOccupationOutput_tenant_occupation_item *)element).tenantOccupationId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Tenant ID: %@\n", ((PROPERTYTenantOccupationOutput_tenant_occupation_item *)element).tenantId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYTenantOccupationOutput_tenant_occupation_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Employer: %@\n", ((PROPERTYTenantOccupationOutput_tenant_occupation_item *)element).employer];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Title: %@\n", ((PROPERTYTenantOccupationOutput_tenant_occupation_item *)element).title];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
            }
            [self.getTenantOccupationList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getPropGenExpBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYPropertyGeneralExpResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyGeneralExpenses;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of property general expense %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Property general expense ID: %@\n", ((PROPERTYPropertyGeneralExpOutput_property_general_expenses_item *)element).propertyGeneralExpenseId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Property ID: %@\n", ((PROPERTYPropertyGeneralExpOutput_property_general_expenses_item *)element).propertyId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYPropertyGeneralExpOutput_property_general_expenses_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Monthly condo fee: %@\n", ((PROPERTYPropertyGeneralExpOutput_property_general_expenses_item *)element).monthlyCondoFee];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Yearly property insurance: %@\n", ((PROPERTYPropertyGeneralExpOutput_property_general_expenses_item *)element).yearlyPropertyInsurance];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Monthly home warranty: %@\n", ((PROPERTYPropertyGeneralExpOutput_property_general_expenses_item *)element).monthlyHomeWarranty];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
                NSString *recordSeven = [NSString stringWithFormat:@"Receipt copy: %@\n", ((PROPERTYPropertyGeneralExpOutput_property_general_expenses_item *)element).receiptCopy];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSeven];
            }
            [self.getPropGenExpList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getPropMortLoanBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYPropertyMortgageLoanResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.propertyMortgageLoan;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of property mortgage loan %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Property mortgage loan ID: %@\n", ((PROPERTYPropertyMortgageLoanOutput_property_mortgage_loan_item *)element).propertyMortgageLoanId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Property ID: %@\n", ((PROPERTYPropertyMortgageLoanOutput_property_mortgage_loan_item *)element).propertyId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYPropertyMortgageLoanOutput_property_mortgage_loan_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Mortgage lender: %@\n", ((PROPERTYPropertyMortgageLoanOutput_property_mortgage_loan_item *)element).mortgageLender];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Monthly mortgage amount: %@\n", ((PROPERTYPropertyMortgageLoanOutput_property_mortgage_loan_item *)element).monthlyMortgageAmount];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Outstanding balance: %@\n", ((PROPERTYPropertyMortgageLoanOutput_property_mortgage_loan_item *)element).outstandingBalance];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
            }
            [self.getPropMortLoanList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getTenantRefBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYTenantRefResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.tenantReferences;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of tenants %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Tenant reference ID: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).tenantReferenceId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Tenant ID: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).tenantId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"First name: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).firstName];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"Last name: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).lastName];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Address line 1: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).addressLine1];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
                NSString *recordSeven = [NSString stringWithFormat:@"Address line 2: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).addressLine2];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSeven];
                NSString *recordEight = [NSString stringWithFormat:@"City: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).city];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordEight];
                NSString *recordNine = [NSString stringWithFormat:@"State: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).tenantState];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordNine];
                NSString *recordTen = [NSString stringWithFormat:@"Zip: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).zip];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTen];
                NSString *recordEleven = [NSString stringWithFormat:@"County / District: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).countyOrDistrict];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordEleven];
                NSString *recordTwl = [NSString stringWithFormat:@"Contact phone: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).contactPhone];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwl];
                NSString *recordthirdt = [NSString stringWithFormat:@"Contact email: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).contactEmail];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordthirdt];
                NSString *recordfourt = [NSString stringWithFormat:@"Primary contact: %@\n", ((PROPERTYTenantRefOutput_tenant_references_item *)element).primaryContact];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordfourt];
            }
            [self.getTenantList setText:InfoWithCount];
        }
        return nil;
    }];
}

- (IBAction)getRentalAgreeBtnPress:(id)sender {
    NSString *Display = @"";
    
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
            NSString *Info = [Display stringByAppendingString:@"Success...\n"];
            
            //Convert result object to maint result
            PROPERTYRentalAgreementResult *result_var;
            result_var=task.result;
            
            //Obtain array of maint exp
            NSArray *arrData = result_var.output.rentalAgreement;
            long cnt;
            cnt = arrData.count;
            
            //Print out count of maint exp
            NSString *Count = [NSString stringWithFormat:@"Number of rental agreement %lu\n",cnt];
            NSString *InfoWithCount = [Info stringByAppendingString:Count];
            
            //Print out each maint exp details to the console
            for (id element in arrData){
                NSString *record = [NSString stringWithFormat:@"Rental agreement ID: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).rentalAgreementId];
                InfoWithCount = [InfoWithCount stringByAppendingString:record];
                NSString *recordTwo = [NSString stringWithFormat:@"Tenant ID: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).tenantId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTwo];
                NSString *recordThree = [NSString stringWithFormat:@"Owner ID: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).ownerId];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordThree];
                NSString *recordFour = [NSString stringWithFormat:@"Start date: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).startDate];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFour];
                NSString *recordFive = [NSString stringWithFormat:@"End date: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).endDate];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordFive];
                NSString *recordSix = [NSString stringWithFormat:@"Monthly rent: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).monthlyRent];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSix];
                NSString *recordSeven = [NSString stringWithFormat:@"Monthly rent due: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).monthlyRentDue];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordSeven];
                NSString *recordEight = [NSString stringWithFormat:@"Advance: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).advance];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordEight];
                NSString *recordNine = [NSString stringWithFormat:@"Number of occupants: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).numberOfOccupants];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordNine];
                NSString *recordTen = [NSString stringWithFormat:@"Renewal or first term: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).renewalOfFirstTerm];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordTen];
                NSString *recordEleven = [NSString stringWithFormat:@"Rental agreement copy: %@\n", ((PROPERTYRentalAgreementOutput_rental_agreement_item *)element).rentalAgreementCopy];
                InfoWithCount = [InfoWithCount stringByAppendingString:recordEleven];
            }
            [self.getRentalAgreeList setText:InfoWithCount];
        }
        return nil;
    }];
}

// MARK: Actions for updating existing records
- (IBAction)updateMaintExpTypeBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *MaintExpTypeId = self.updateMaintExpTypeId.text;
    NSString *OwnerId = self.updateMaintExpTypeOwnerId.text;
    NSString *Desrip = self.updateMaintExpTypeDescription.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYMaintenanceExpTypeInput *MaintenanceExpenseTypeInput = [[PROPERTYMaintenanceExpTypeInput alloc] init];
    
    MaintenanceExpenseTypeInput.maintenanceExpenseId = [f numberFromString:MaintExpTypeId];
    MaintenanceExpenseTypeInput.ownerId=[f numberFromString:OwnerId];
    MaintenanceExpenseTypeInput._description = Desrip;
    
    //Invoke Put on employee API
    [[client maintenanceExpensePut:MaintenanceExpenseTypeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your maintenance expense type has been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updateMaintExpTypeDescription resignFirstResponder];
    
}


- (IBAction)updatePropertyBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *PropertyId = self.updatePropertyId.text;
    NSString *OwnerId = self.updatePropertyOwnerId.text;
    NSString *AddrLine1 = self.updatePropertyAddrLine1.text;
    NSString *AddrLine2 = self.updatePropertyAddrLine2.text;
    NSString *City = self.updatePropertyCity.text;
    NSString *State = self.updatePropertyState.text;
    NSString *Zip = self.updatePropertyZip.text;
    NSString *County = self.updatePropertyCounty.text;
    NSString *Descrip = self.updatePropertyDescription.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyInput *propertyInput = [[PROPERTYPropertyInput alloc] init];
    
    propertyInput.propertyId =[f numberFromString:PropertyId];
    propertyInput.ownerId=[f numberFromString:OwnerId];
    propertyInput.addressLine1 = AddrLine1;
    propertyInput.addressLine2 = AddrLine2;
    propertyInput.city = City;
    propertyInput.propState = State;
    propertyInput.zip = Zip;
    propertyInput.countyOrDistrict = County;
    propertyInput._description = Descrip;
    propertyInput.pictures = @"Test from Xcode";
    
    //Invoke PUT on employee API
    [[client propertiesPut:propertyInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property has been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updatePropertyDescription resignFirstResponder];
    
}


- (IBAction)updateTenantBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *TenantId = self.updateTenantId.text;
    NSString *OwnerId = self.updateTenantOwnerId.text;
    NSString *FirstName = self.updateTenantFirstName.text;
    NSString *MiddleName = self.updateTenantMiddleName.text;
    NSString *LastName = self.updateTenantLastName.text;
    NSString *Age = self.updateTenantAge.text;
    NSString *PropId = self.updateTenantPropId.text;
    NSString *Email = self.updateTenantEmail.text;
    NSString *Phone = self.updateTenantPhone.text;
    NSString *PrimaryCon = self.updateTenantPrimaryCon.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantInput *tenantInput = [[PROPERTYTenantInput alloc] init];
    
    tenantInput.tenantId = [f numberFromString:TenantId];
    tenantInput.ownerId=[f numberFromString:OwnerId];
    tenantInput.firstName = FirstName;
    tenantInput.lastName = LastName;
    tenantInput.middleName = MiddleName;
    tenantInput.age = [f numberFromString:Age];
    tenantInput.propertyId = [f numberFromString:PropId];
    tenantInput.contactEmail = Email;
    tenantInput.contactPhone = Phone;
    tenantInput.primaryContact = PrimaryCon;
    
    
    //Invoke PUT on employee API
    [[client tenantsPut:tenantInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updateTenantPrimaryCon resignFirstResponder];
    
}


- (IBAction)updatePurchaseDetailBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSString *PurchaseId = self.updatePurchaseDetailId.text;
    NSString *OwnerId = self.updatePurchaseDetailOwnerId.text;
    NSString *PropId = self.updatePurchaseDetailPropId.text;
    NSString *Year = self.updatePurchaseDetailYear.text;
    NSString *Price = self.updatePurchaseDetailPrice.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPurchaseDetailsInput *purchaseInput = [[PROPERTYPurchaseDetailsInput alloc] init];
    
    purchaseInput.purchaseId=[f numberFromString:PurchaseId];
    purchaseInput.ownerId=[f numberFromString:OwnerId];
    purchaseInput.propertyId=[f numberFromString:PropId];
    purchaseInput.yearOfPurchase=[f numberFromString:Year];
    purchaseInput.price=[f numberFromString:Price];
    
    //Invoke PUT on employee API
    [[client purchaseDetailsPut:purchaseInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your purchase details have been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updatePurchaseDetailPrice resignFirstResponder];
    
}


- (IBAction)updatePropMaintExpBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *PropMaintExpId = self.updatePropMaintExpId.text;
    NSString *PropId = self.updatePropMaintExpPropId.text;
    NSString *OwnerId = self.updatePropMaintExpOwnerId.text;
    NSString *MaintExpId = self.updatePropMaintExpExpId.text;
    NSString *ExpAmt = self.updatePropMaintExpExpAmt.text;
    NSString *Date = self.updatePropMaintExpReceiptDate.text;
    NSString *Copy = self.updatePropMaintExpReceiptCopy.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMaintExpInput *propertyMaintInput = [[PROPERTYPropertyMaintExpInput alloc] init];
    
    propertyMaintInput.propertyMaintanenceExpenseId = [f numberFromString:PropMaintExpId];
    propertyMaintInput.propertyId = [f numberFromString:PropId];
    propertyMaintInput.ownerId = [f numberFromString:OwnerId];
    propertyMaintInput.maintenanceExpenseId =[f numberFromString:MaintExpId];
    propertyMaintInput.expenseAmount = [f numberFromString:ExpAmt];
    propertyMaintInput.receiptCopy = Copy;
    propertyMaintInput.receiptDate = Date;
    
    
    //Invoke PUT on employee API
    [[client propMaintExpensePut:propertyMaintInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call ... Your property maintenance has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.updatePropMaintExpReceiptCopy resignFirstResponder];
    
}


- (IBAction)updatePropTaxBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *PropTaxId = self.updatePropTaxId.text;
    NSString *PropId = self.updatePropTaxPropId.text;
    NSString *OwnerId = self.updatePropTaxOwnerId.text;
    NSString *Year = self.updatePropTaxYear.text;
    NSString *YearPaid = self.updatePropTaxYearPaid.text;
    NSString *AnnualTax = self.updatePropTaxAnnualTax.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyTaxInput *propertyTaxInput = [[PROPERTYPropertyTaxInput alloc] init];
    
    propertyTaxInput.propertyTaxId = [f numberFromString:PropTaxId];
    propertyTaxInput.propertyId = [f numberFromString:PropId];
    propertyTaxInput.ownerId = [f numberFromString:OwnerId];
    propertyTaxInput.yearOwed = [f numberFromString:Year];
    propertyTaxInput.yearPaid = [f numberFromString:YearPaid];
    propertyTaxInput.annualTax = [f numberFromString:AnnualTax];
    
    //Invoke PUT on employee API
    [[client propTaxPut:propertyTaxInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property tax has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.updatePropTaxAnnualTax resignFirstResponder];
    
}


- (IBAction)updateTenantBgCheckBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *TenantBgCheckId = self.updateTenantBgCheckId.text;
    NSString *TenantId = self.updateTenantBgCheckTenantId.text;
    NSString *OwnerId = self.updateTenantBgCheckOwnerId.text;
    NSString *Credit = self.updateTenantBgCheckCredit.text;
    NSString *Criminal = self.updateTenantBgCheckCriminalPass.text;
    NSString *Eviction = self.updateTenantBgCheckEviction.text;
    NSString *Recommendation = self.updateTenantBgCheckRecommendation.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantBackgroundInput *backgroundCheckInput = [[PROPERTYTenantBackgroundInput alloc] init];
    
    backgroundCheckInput.tenantBackgroundCheckId=[f numberFromString:TenantBgCheckId];
    backgroundCheckInput.tenantId=[f numberFromString:TenantId];
    backgroundCheckInput.ownerId=[f numberFromString:OwnerId];
    backgroundCheckInput.creditPassedYN=Credit;
    backgroundCheckInput.criminalPassed=Criminal;
    backgroundCheckInput.evictionPassedYN=Eviction;
    backgroundCheckInput.recommendation=Recommendation;
    
    //Invoke PUT on employee API
    [[client backgroundCheckPut:backgroundCheckInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant background check information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updateTenantBgCheckRecommendation resignFirstResponder];
    
}


- (IBAction)updateTenantIncomeExpBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *TenantIncomeExpId = self.updateTenantIncomeExpId.text;
    NSString *TenantId = self.updateTenantIncomeExpTenantId.text;
    NSString *OwnerId = self.updateTenantIncomeExpOwnerId.text;
    NSString *PropOwnId = self.updateTenantIncomeExpPropOwnId.text;
    NSString *Income = self.updateTenantIncomeExpMonthlyInc.text;
    NSString *Exp = self.updateTenantIncomeExpMonExp.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantIncomeInput *tenantIncomeInput = [[PROPERTYTenantIncomeInput alloc] init];
    
    tenantIncomeInput.tenantIncomeExpenseId = [f numberFromString:TenantIncomeExpId];
    tenantIncomeInput.tenantId=[f numberFromString:TenantId];
    tenantIncomeInput.ownerId=[f numberFromString:OwnerId];
    tenantIncomeInput.propertyOwnerId = [f numberFromString:PropOwnId];
    tenantIncomeInput.monthlyIncome=[f numberFromString:Income];
    tenantIncomeInput.monthlyExpenses=[f numberFromString:Exp];
    
    //Invoke PUT on employee API
    [[client tenantsIncomeExpensePut:tenantIncomeInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income expenses information has been update. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updateTenantIncomeExpMonExp resignFirstResponder];
    
}


- (IBAction)updateTenantOccBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *TenantOccId = self.updateTenantOccId.text;
    NSString *TenantId = self.updateTenantOccTenantId.text;
    NSString *OwnerId = self.updateTenantOccOwnerId.text;
    NSString *Employer = self.updateTenantOccEmployer.text;
    NSString *Title = self.updateTenantOccTitle.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantOccupationInput *tenantOccupationInput = [[PROPERTYTenantOccupationInput alloc] init];
    
    tenantOccupationInput.tenantOccupationId=[f numberFromString:TenantOccId];
    tenantOccupationInput.tenantId=[f numberFromString:TenantId];
    tenantOccupationInput.ownerId=[f numberFromString:OwnerId];
    tenantOccupationInput.employer = Employer;
    tenantOccupationInput.title = Title;
    
    //Invoke PUT on employee API
    [[client tenantsOccupationPut:tenantOccupationInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant income occupation information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updateTenantOccTitle resignFirstResponder];
    
}


- (IBAction)updatePropGenExpBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *PropGenExpId = self.updatePropGenExpId.text;
    NSString *PropId = self.updatePropGenExpPropId.text;
    NSString *OwnerId = self.updatePropGenExpOwnerId.text;
    NSString *MonFee = self.updatePropGenExpMonFee.text;
    NSString *MonWarranty = self.updatePropGenExpMonWarranty.text;
    NSString *YearIns = self.updatePropGenExpYearIns.text;
    NSString *Cp = self.updatePropGenExpReceipyCp.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyGeneralExpInput *propertyGeneralInput = [[PROPERTYPropertyGeneralExpInput alloc] init];
    
    
    propertyGeneralInput.propertyGeneralExpenseId = [f numberFromString:PropGenExpId];
    propertyGeneralInput.propertyId = [f numberFromString:PropId];
    propertyGeneralInput.ownerId = [f numberFromString:OwnerId];
    propertyGeneralInput.monthlyCondoFee = [f numberFromString:MonFee];
    propertyGeneralInput.monthlyHomeWarranty = [f numberFromString:MonWarranty];
    propertyGeneralInput.yearlyPropertyInsurance = [f numberFromString:YearIns];
    propertyGeneralInput.receiptCopy = Cp;
    
    
    
    //Invoke PUT on employee API
    [[client generalExpensesPut:propertyGeneralInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your property general expense has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.updatePropGenExpReceipyCp resignFirstResponder];
    
}


- (IBAction)updatePropMortLoanBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *PropMortLoanId = self.updatePropMortLoanId.text;
    NSString *PropId = self.updatePropMortLoanPropId.text;
    NSString *OwnerId = self.updatePropMortLoanOwnerId.text;
    NSString *Lender = self.updatePropMortLoanLender.text;
    NSString *Amt = self.updatePropMortLoanAmt.text;
    NSString *Balance = self.updatePropMortLoanBalance.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyMortgageLoanInput *propertyMortgageInput = [[PROPERTYPropertyMortgageLoanInput alloc] init];
    
    propertyMortgageInput.propertyMortgageLoanId = [f numberFromString:PropMortLoanId];
    propertyMortgageInput.propertyId = [f numberFromString:PropId];
    propertyMortgageInput.ownerId = [f numberFromString:OwnerId];
    propertyMortgageInput.mortgageLender = [f numberFromString:Lender];
    propertyMortgageInput.monthlyMortgageAmount = [f numberFromString:Amt];
    propertyMortgageInput.outstandingBalance = [f numberFromString:Balance];
    
    
    //Invoke POST on employee API
    [[client propMortgageLoanPut:propertyMortgageInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your mortgage loan has been updated. Please check in the database.\n");
            
        }
        
        return nil;
    }];
    
    [self.updatePropMortLoanBalance resignFirstResponder];
    
}


- (IBAction)updateRentalAgreeBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *RentalAgreeId = self.updateRentalAgreeId.text;
    NSString *OwnerId = self.updateRentalAgreeOwnerId.text;
    NSString *TenantId = self.updateRentalAgreeTenantId.text;
    NSString *Num = self.updateRentalAgreeNumOfOcc.text;
    NSString *Rent = self.updateRentalAgreeMonRent.text;
    NSString *RentDue = self.updateRentalAgreeRentDue.text;
    NSString *StartD = self.updateRentalAgreeStartD.text;
    NSString *EndD = self.updateRentalAgreeEndD.text;
    NSString *Renew = self.updateRentalAgreeRenew.text;
    NSString *Copy = self.updateRentalAgreeCp.text;
    NSString *Advance = self.updateRentalAgreeAdvance.text;
    
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYRentalAgreementInput *rentalAgreementInput = [[PROPERTYRentalAgreementInput alloc] init];
    
    rentalAgreementInput.rentalAgreementId = [f numberFromString:RentalAgreeId];
    rentalAgreementInput.ownerId=[f numberFromString:OwnerId];
    rentalAgreementInput.tenantId=[f numberFromString:TenantId];
    rentalAgreementInput.numberOfOccupants=[f numberFromString:Num];
    rentalAgreementInput.monthlyRent=[f numberFromString:Rent];
    rentalAgreementInput.monthlyRentDue = RentDue;
    rentalAgreementInput.startDate = StartD;
    rentalAgreementInput.endDate = EndD;
    rentalAgreementInput.renewalOfFirstTerm = Renew;
    rentalAgreementInput.rentalAgreementCopy = Copy;
    rentalAgreementInput.advance=[f numberFromString:Advance];
    
    
    //Invoke PUT on employee API
    [[client rentalAgreementPut:rentalAgreementInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call. Your rental agreement has been updated... Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updateRentalAgreeAdvance resignFirstResponder];
    
}


- (IBAction)updateTenantRefBtnPress:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *TenantRefId = self.updateTenantRefId.text;
    NSString *TenantId = self.updateTenantRefTenantId.text;
    NSString *OwnerId = self.updateTenantRefOwnerId.text;
    NSString *FirstN = self.updateTenantRefFirstN.text;
    NSString *LastN = self.updateTenantRefLastN.text;
    NSString *Addr1 = self.updateTenantRefAddr1.text;
    NSString *Addr2 = self.updateTenantRefAddr2.text;
    NSString *City = self.updateTenantRefCity.text;
    NSString *State = self.updateTenantRefState.text;
    NSString *Zip = self.updateTenantRefZip.text;
    NSString *County = self.updateTenantRefCounty.text;
    NSString *Email = self.updateTenantRefEmail.text;
    NSString *Phone = self.updateTenantRefPhone.text;
    NSString *Contact = self.updateTenantRefPrimary.text;
    
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYTenantRefInput *tenantRefInput = [[PROPERTYTenantRefInput alloc] init];
    
    tenantRefInput.tenantReferenceId = [f numberFromString:TenantRefId];
    tenantRefInput.tenantId=[f numberFromString:TenantId];
    tenantRefInput.ownerId=[f numberFromString:OwnerId];
    tenantRefInput.firstName = FirstN;
    tenantRefInput.lastName = LastN;
    tenantRefInput.addressLine1 = Addr1;
    tenantRefInput.addressLine2 = Addr2;
    tenantRefInput.city = City;
    tenantRefInput.tenantState = State;
    tenantRefInput.zip = Zip;
    tenantRefInput.countyOrDistrict = County;
    tenantRefInput.contactEmail = Email;
    tenantRefInput.contactPhone = Phone;
    tenantRefInput.primaryContact = Contact;
    
    
    //Invoke Put on employee API
    [[client tenantsReferencePut:tenantRefInput ] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task){
        
        if (task.error) {
            NSLog(@"Error: %@", task.error);
            return nil;
        }
        
        if (task.result) {
            
            //You are here, so method invocation is a success
            
            printf("Success....\n");
            
            NSLog(@"Return from API call.Tenant reference information has been updated. Please check in the database...\n");
            
        }
        
        return nil;
    }];
    
    [self.updateTenantRefPrimary resignFirstResponder];
    
}


@end
