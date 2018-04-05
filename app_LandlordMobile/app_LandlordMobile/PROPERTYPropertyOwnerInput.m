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
 

#import "PROPERTYPropertyOwnerInput.h"

@implementation PROPERTYPropertyOwnerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"ownerName": @"owner_name",
             @"email": @"email",
             @"password": @"password",
             @"createdDate": @"created_date",
             @"activatedYN": @"activated_YN",
             @"profileMemo": @"profile_memo"
             };
}

@end
