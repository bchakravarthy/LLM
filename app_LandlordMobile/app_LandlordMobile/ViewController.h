 //
//  ViewController.h
//  app_LandlordMobile
//
//  Created by Nafisa Hasan on 4/3/18.
//  Copyright © 2018 Nafisa Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// MARK: Login
@property (weak, nonatomic) IBOutlet UITextField *login_username;
@property (weak, nonatomic) IBOutlet UITextField *login_password;


// MARK: Register
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerName;
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerPassword;
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerDate;
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerEmail;
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerActivated;
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerProfile;


// MARK: Add property
@property (weak, nonatomic) IBOutlet UITextField *addPropAddrLine1;
@property (weak, nonatomic) IBOutlet UITextField *addPropAddrLine2;
@property (weak, nonatomic) IBOutlet UITextField *addPropCity;
@property (weak, nonatomic) IBOutlet UITextField *addPropState;
@property (weak, nonatomic) IBOutlet UITextField *addPropZip;
@property (weak, nonatomic) IBOutlet UITextField *addPropCounty;
@property (weak, nonatomic) IBOutlet UITextField *addPropDescrp;


// MARK: Property general expense
@property (weak, nonatomic) IBOutlet UITextField *addPropGenExpPropId;
@property (weak, nonatomic) IBOutlet UITextField *addPropGenExpOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPropGenExpMonthlyFee;
@property (weak, nonatomic) IBOutlet UITextField *addPropGenExpYearlyIns;
@property (weak, nonatomic) IBOutlet UITextField *addPropGenExpWarranty;
@property (weak, nonatomic) IBOutlet UITextField *addPropGenExpDescrip;


// MARK: Property maintenance expense
@property (weak, nonatomic) IBOutlet UITextField *addPropMaintExpPropId;
@property (weak, nonatomic) IBOutlet UITextField *addPropMaintExpOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPropMaintExpExpId;
@property (weak, nonatomic) IBOutlet UITextField *addPropMaintExpExpAmt;
@property (weak, nonatomic) IBOutlet UITextField *addPropMaintExpReceiptDate;
@property (weak, nonatomic) IBOutlet UITextField *addPropMaintExpReceiptCopy;


// MARK: Maintenance Expense Types
@property (weak, nonatomic) IBOutlet UITextField *addMaintExpTypeOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addMaintExpTypeDescp;


// MARK: Purchase details
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailPropId;
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailYear;
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailPrice;


// MARK: Tenant Occupation
@property (weak, nonatomic) IBOutlet UITextField *addTenantOccupTenantId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantOccupOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantEmployer;
@property (weak, nonatomic) IBOutlet UITextField *addTenantOccupTitle;


// MARK: Tenant Background Check
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckTenantId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckCriminalPass;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckCreditPass;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckEviction;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckRec;



// MARK: PropertyTax
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxPropId;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxYear;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxYearPaid;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxAnnualTax;



@end

