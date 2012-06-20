//
//  RackView.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/14/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Organization.h"


@interface RackView : UIViewController {
	
	
	NSManagedObjectContext *managedObjectContext;
	Organization *organization;
	NSMutableArray *rackArray;


}

@property (nonatomic, retain)  NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Organization *organization;


@end
