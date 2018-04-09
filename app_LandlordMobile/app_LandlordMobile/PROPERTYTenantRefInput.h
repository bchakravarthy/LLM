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

 
@interface PROPERTYTenantRefInput : AWSModel

@property (nonatomic, strong, nonnull) NSNumber *tenantId;


@property (nonatomic, strong, nonnull) NSNumber *ownerId;


@property (nonatomic, strong, nonnull) NSString *firstName;


@property (nonatomic, strong, nonnull) NSString *lastName;


@property (nonatomic, strong, nonnull) NSString *addressLine1;


@property (nonatomic, strong, nonnull) NSString *addressLine2;


@property (nonatomic, strong, nonnull) NSString *city;


@property (nonatomic, strong, nonnull) NSString *state;


@property (nonatomic, strong, nonnull) NSString *zip;


@property (nonatomic, strong, nonnull) NSString *contactEmail;


@property (nonatomic, strong, nonnull) NSString *contactPhone;


@property (nonatomic, strong, nonnull) NSString *primaryContact;


@property (nonatomic, strong, nonnull) NSString *countyOrDistrict;


@end
