//
//  Organization.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/13/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Ribbon;

@interface Organization :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * orgName;
@property (nonatomic, retain) NSString * orgDesc;
@property (nonatomic, retain) NSSet* orgRibbon;

@end


@interface Organization (CoreDataGeneratedAccessors)
- (void)addOrgRibbonObject:(Ribbon *)value;
- (void)removeOrgRibbonObject:(Ribbon *)value;
- (void)addOrgRibbon:(NSSet *)value;
- (void)removeOrgRibbon:(NSSet *)value;

@end

