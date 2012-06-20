//
//  Ribbon.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/14/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Organization;

@interface Ribbon :  NSManagedObject  
{
}
//TEST

@property (nonatomic, retain) NSNumber * isRibbonSelected;
@property (nonatomic, retain) NSString * ribbonImage;
@property (nonatomic, retain) NSString * ribbonName;
@property (nonatomic, retain) NSString * ribbonDesc;
@property (nonatomic, retain) Organization * orgRibbon;

@end



