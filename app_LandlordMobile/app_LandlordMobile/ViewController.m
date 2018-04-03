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
    
    //Instantiate the API client class:
     PROPERTYPropertyMangementClient *client = [PROPERTYPropertyMangementClient defaultClient];
    
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast2
                                                          identityPoolId:@"us-east-2:673767f7-1e5f-431b-9bb2-4cfd8c9b3466"];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast2 credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
    //get
    
    
    PROPERTYMaintenanceExpTypeInput *input = [[PROPERTYMaintenanceExpTypeInput alloc] init];
    
    input.ownerId = [NSNumber numberWithInt:2];
    input._description = @"This is a test from Nafisa!";
    
    [[client maintenanceExpensePost:input]
     continueWithBlock:^id _Nullable(AWSTask * _Nonnull task)
     {
         NSLog(@"Output from API call %@", [self handleApiResponse:task]);
         //_helloLabel.text=[self handleApiResponse:task];
         return nil;
     }];
    
   
}


- (NSString *)handleApiResponse:(AWSTask *)task {
    if (task.error != nil) {
        return [NSString stringWithFormat: @"Error: %@", task.error.description];
        printf("Error...");
    } else if (task.result != nil && [task.result isKindOfClass:[PROPERTYMaintenanceExpTypeInput class]]) {
        printf("Success....");
        PROPERTYMaintenanceExpTypeInput *result_var;
        result_var = task.result;
        //printf("Int number: %u\n", result_var.input.a);
        //NSLog(@"owner id ownerId %d", [result_var.input.ownerId integerValue]);
       // return [NSString stringWithFormat:@"%@ %@ %@ = %@\n",result_var.input.ownerId];
    }
    return nil;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
