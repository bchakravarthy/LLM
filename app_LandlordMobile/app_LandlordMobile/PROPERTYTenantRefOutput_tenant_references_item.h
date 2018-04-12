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
 

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>

 
@interface PROPERTYTenantRefOutput_tenant_references_item : AWSModel

@property (nonatomic, strong, nullable) NSNumber *tenantReferenceId;


@property (nonatomic, strong, nullable) NSNumber *tenantId;


@property (nonatomic, strong, nullable) NSNumber *ownerId;


@property (nonatomic, strong, nullable) NSString *firstName;


@property (nonatomic, strong, nullable) NSString *lastName;


@property (nonatomic, strong, nullable) NSString *addressLine1;


@property (nonatomic, strong, nullable) NSString *addressLine2;


@property (nonatomic, strong, nullable) NSString *city;


@property (nonatomic, strong, nullable) NSString *tenantState;


@property (nonatomic, strong, nullable) NSString *countyOrDistrict;


@property (nonatomic, strong, nullable) NSString *zip;


@property (nonatomic, strong, nullable) NSNumber *contactEmail;


@property (nonatomic, strong, nullable) NSString *contactPhone;


@property (nonatomic, strong, nullable) NSString *primaryContact;


@end
