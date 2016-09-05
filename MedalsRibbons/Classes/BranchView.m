//
//  BranchView.m
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/6/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import "BranchView.h"
#import "Organization.h"
#import "RibbonView.h"

@implementation BranchView

@synthesize tableView;
@synthesize managedObjectContext;


- (void)viewDidLoad {
    
	managedObjectContext = [(BranchView *)[[UIApplication sharedApplication] delegate] managedObjectContext];
	
	NSError *error;
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Organization" inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];
	
	orgArray = [[managedObjectContext 
				 executeFetchRequest:request error:&error]
				mutableCopy];
	
	[request release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	
	return [orgArray count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

	static NSString *CellIdentifier = @"BranchCellID";
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil)
    {
	  cell =[[[UITableViewCell alloc]
	  initWithFrame:CGRectZero
	  reuseIdentifier:CellIdentifier]
	  autorelease];
	}
	
	Organization *org = (Organization *)[orgArray objectAtIndex:indexPath.row];
	
	cell.textLabel.textAlignment = UITextAlignmentCenter;
	cell.textLabel.text = org.orgName;
	cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	RibbonView *ribbonView = [[RibbonView alloc] initWithNibName:@"RibbonView" bundle:[NSBundle mainBundle]];
	
	Organization *organization = (Organization *)[orgArray objectAtIndex:indexPath.row];
	
	ribbonView.organization = organization;

	ribbonView.managedObjectContext = self.managedObjectContext;

	[self.navigationController pushViewController:ribbonView animated:YES];

	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [organization release];	
	[ribbonView release];
			 
}

- (void)dealloc {
	[managedObjectContext release];
	[orgArray release];
	[tableView release];
    [super dealloc];
}

@end
