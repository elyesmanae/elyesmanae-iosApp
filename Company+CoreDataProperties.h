//
//  Company+CoreDataProperties.h
//  SubViewProject
//
//  Created by Elzes on 18.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//
//

#import "Company+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Company (CoreDataProperties)

+ (NSFetchRequest<Company *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *adress;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *service;

@end

NS_ASSUME_NONNULL_END
