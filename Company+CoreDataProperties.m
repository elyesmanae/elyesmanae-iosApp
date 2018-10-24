//
//  Company+CoreDataProperties.m
//  SubViewProject
//
//  Created by Elzes on 18.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//
//

#import "Company+CoreDataProperties.h"

@implementation Company (CoreDataProperties)

+ (NSFetchRequest<Company *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Company"];
}

@dynamic adress;
@dynamic name;
@dynamic service;

@end
