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


// MARK: Property
@property (weak, nonatomic) IBOutlet UITextField *addPropOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPropAddrLine1;
@property (weak, nonatomic) IBOutlet UITextField *addPropAddrLine2;
@property (weak, nonatomic) IBOutlet UITextField *addPropCity;
@property (weak, nonatomic) IBOutlet UITextField *addPropState;
@property (weak, nonatomic) IBOutlet UITextField *addPropZip;
@property (weak, nonatomic) IBOutlet UITextField *addPropCounty;
@property (weak, nonatomic) IBOutlet UITextField *addPropDescrp;
// Get property
@property (weak, nonatomic) IBOutlet UITextView *getPropList;
// For update
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyDescription;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyAddrLine1;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyAddrLine2;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyCity;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyState;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyZip;
@property (weak, nonatomic) IBOutlet UITextField *updatePropertyCounty;


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
// For GET
@property (weak, nonatomic) IBOutlet UITextView *getPropMaintExpList;
// For Update
@property (weak, nonatomic) IBOutlet UITextField *updatePropMaintExpId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropMaintExpPropId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropMaintExpOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropMaintExpExpId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropMaintExpExpAmt;
@property (weak, nonatomic) IBOutlet UITextField *updatePropMaintExpReceiptDate;
@property (weak, nonatomic) IBOutlet UITextField *updatePropMaintExpReceiptCopy;


// MARK: Maintenance Expense Types
@property (weak, nonatomic) IBOutlet UITextField *addMaintExpTypeOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addMaintExpTypeDescp;
// For GET
@property (weak, nonatomic) IBOutlet UITextView *getMaintExpTypeList;
// For UPDATE
@property (weak, nonatomic) IBOutlet UITextField *updateMaintExpTypeOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *updateMaintExpTypeDescription;
@property (weak, nonatomic) IBOutlet UITextField *updateMaintExpTypeId;


// MARK: Purchase details
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailPropId;
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailYear;
@property (weak, nonatomic) IBOutlet UITextField *addPurchaseDetailPrice;
// For get purchase detail
@property (weak, nonatomic) IBOutlet UITextView *getPurchaseDetailList;
// For update purchase detail
@property (weak, nonatomic) IBOutlet UITextField *updatePurchaseDetailId;
@property (weak, nonatomic) IBOutlet UITextField *updatePurchaseDetailOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *updatePurchaseDetailPropId;
@property (weak, nonatomic) IBOutlet UITextField *updatePurchaseDetailYear;
@property (weak, nonatomic) IBOutlet UITextField *updatePurchaseDetailPrice;


// MARK: Tenant
@property (weak, nonatomic) IBOutlet UITextField *addTenantPropertyId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantFirstName;
@property (weak, nonatomic) IBOutlet UITextField *addTenantMiddleName;
@property (weak, nonatomic) IBOutlet UITextField *addTenantLastName;
@property (weak, nonatomic) IBOutlet UITextField *addTenantAge;
@property (weak, nonatomic) IBOutlet UITextField *addTenantContactEmail;
@property (weak, nonatomic) IBOutlet UITextField *addTenantContactPhone;
@property (weak, nonatomic) IBOutlet UITextField *addTenantPrimaryContact;
// For get tenant
@property (weak, nonatomic) IBOutlet UITextView *getTenantList;
// For update tenant
@property (weak, nonatomic) IBOutlet UITextField *updateTenantId;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantPropId;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantFirstName;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantMiddleName;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantLastName;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantAge;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantEmail;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantPhone;
@property (weak, nonatomic) IBOutlet UITextField *updateTenantPrimaryCon;


// MARK: Tenant Occupation
@property (weak, nonatomic) IBOutlet UITextField *addTenantOccupTenantId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantOccupOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantEmployer;
@property (weak, nonatomic) IBOutlet UITextField *addTenantOccupTitle;


// MARK: Tenant reference
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceTenantId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceFirstName;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceLastName;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceAddrLine1;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceAddrLine2;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceCity;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceState;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceZip;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceCounty;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceContactPhone;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferenceContactEmail;
@property (weak, nonatomic) IBOutlet UITextField *addTenantReferencePrimaryContact;


// MARK: Tenant Income Expense
@property (weak, nonatomic) IBOutlet UITextField *addTenantIncomeExpTenantId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantIncomeExpOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantIncomeExpMonthlyIncome;
@property (weak, nonatomic) IBOutlet UITextField *addTenantIncomeExpMonthlyExp;
@property (weak, nonatomic) IBOutlet UITextField *addTenantIncomeExpPropOwnerId;


// MARK: Rental agreement
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeTenantid;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeOwnerid;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeStartDate;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeEndDate;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeMonthRent;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeRentDue;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeAdvance;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeNumOfOcc;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeRenew;
@property (weak, nonatomic) IBOutlet UITextField *addRentalAgreeCopy;


// MARK: Tenant Background Check
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckTenantId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckCriminalPass;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckCreditPass;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckEviction;
@property (weak, nonatomic) IBOutlet UITextField *addTenantBgCheckRec;


// MARK: Property mortgage loan
@property (weak, nonatomic) IBOutlet UITextField *addPropMortLoanPropId;
@property (weak, nonatomic) IBOutlet UITextField *addPropMortLoanOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPropMortLoanLender;
@property (weak, nonatomic) IBOutlet UITextField *addPropMortLoanMonthAmt;
@property (weak, nonatomic) IBOutlet UITextField *addPropMortLoanBalance;


// MARK: PropertyTax
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxPropId;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxYear;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxYearPaid;
@property (weak, nonatomic) IBOutlet UITextField *addPropTaxAnnualTax;
// For Get
@property (weak, nonatomic) IBOutlet UITextView *getPropTaxList;
// For update
@property (weak, nonatomic) IBOutlet UITextField *updatePropTaxId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropTaxPropId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropTaxOwnerId;
@property (weak, nonatomic) IBOutlet UITextField *updatePropTaxYear;
@property (weak, nonatomic) IBOutlet UITextField *updatePropTaxYearPaid;
@property (weak, nonatomic) IBOutlet UITextField *updatePropTaxAnnualTax;



@end

