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
 

#import "PROPERTYPropertyGeneralExpInput.h"

@implementation PROPERTYPropertyGeneralExpInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"propertyGeneralExpenseId": @"property_general_expense_id",
             @"propertyId": @"property_id",
             @"ownerId": @"owner_id",
             @"monthlyCondoFee": @"monthly_condo_fee",
             @"monthlyHomeFee": @"monthly_home_fee",
             @"yearlyPropertyInsurance": @"yearly_property_insurance",
             @"receiptCopy": @"receipt_copy"
             };
}

@end
