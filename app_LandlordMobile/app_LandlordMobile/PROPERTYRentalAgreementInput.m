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
 

#import "PROPERTYRentalAgreementInput.h"

@implementation PROPERTYRentalAgreementInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"ownerId": @"owner_id",
             @"tenantId": @"tenant_id",
             @"numberOfOccupants": @"number_of_occupants",
             @"monthlyRent": @"monthly_rent",
             @"monthlyRentDue": @"monthly_rent_due",
             @"startDate": @"start_date",
             @"endDate": @"end_date",
             @"renewalOfFirstTerm": @"renewal_of_first_term",
             @"rentalAgreementCopy": @"rental_agreement_copy",
             @"advance": @"advance"
             };
}

@end
