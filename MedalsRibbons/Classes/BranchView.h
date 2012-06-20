//
//  BranchView.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/6/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Organization.h"
#import "RibbonView.h"



@interface BranchView : UIViewController {

	UITableView *tableView;
	NSMutableArray *orgArray;
    NSManagedObjectContext *managedObjectContext;
	
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain)  NSManagedObjectContext *managedObjectContext;

@end
