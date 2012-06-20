//
//  RibbonView.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/12/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Organization.h"
#import "MedalInfoView.h"



@interface RibbonView : UIViewController {
	
	UITableView *tableView;
	UIBarButtonItem *rackButton;
	NSMutableArray *ribArray;
	MedalInfoView *medalInfoView;
	
    NSManagedObjectContext *managedObjectContext;
	Organization *organization;

}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *rackButton;
@property (nonatomic, retain) MedalInfoView *medalInfoView;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Organization *organization;


- (IBAction)buildRack ;
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

@end
