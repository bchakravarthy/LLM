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
 

#import "PROPERTYMaintenanceExpTypeOutput_maintenance_expense_types_item.h"

@implementation PROPERTYMaintenanceExpTypeOutput_maintenance_expense_types_item

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"maintenanceExpenseId": @"maintenance_expense_id",
             @"ownerId": @"owner_id",
             @"_description": @"description"
             };
}

@end
