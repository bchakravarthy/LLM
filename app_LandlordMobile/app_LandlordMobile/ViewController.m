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
    //[self insertPropertyMortgageLoan];
    //[self insertPropertyOwner];
    //[self insertPropertyTax];
    //[self insertPurchaseDetails];
    [self insertRentalAgreement];
}

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
    propertyInput.addressLine2 = @"";
    propertyInput.city = @"Columbus";
    propertyInput.state = @"Ohio";
    propertyInput.zip = @"43201";
    propertyInput.countyOrDistrict = @"43201";
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

//post for property general exp
- (void) insertPropertyGeneralExp {
    //Instantiate client object
    PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    //Assign input values to be sent to Dynamo DB via API call
    PROPERTYPropertyGeneralExpInput *propertyGeneralInput = [[PROPERTYPropertyGeneralExpInput alloc] init];
    
    propertyGeneralInput.propertyId = [NSNumber numberWithInt:1];
    propertyGeneralInput.ownerId = [NSNumber numberWithInt:1];
    propertyGeneralInput.monthlyHomeFee = [NSNumber numberWithInt:1];
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
        propertyMortgageInput.outstandingBalance = [NSNumber numberWithInt:1];
    
    
    
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

//post for purchase details
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
