//
//  RibbonView.m
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/12/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import "RibbonView.h"
#import "RackView.h"
#import "Ribbon.h"
#import "MedalInfoView.h"

@implementation RibbonView

@synthesize tableView;
@synthesize rackButton;
@synthesize medalInfoView;

@synthesize managedObjectContext;
@synthesize organization;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
 
	tableView.rowHeight = 50.0;
	
	medalInfoView = [[MedalInfoView alloc] initWithNibName:@"MedalInfoView" bundle:[NSBundle mainBundle]];

	managedObjectContext = [(RibbonView *)[[UIApplication sharedApplication] delegate] managedObjectContext];
	
	
	NSError *error;
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Ribbon" inManagedObjectContext:managedObjectContext];
	
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"orgRibbon == %@", organization];
	
	[request setEntity:entity];
	[request setPredicate:predicate];
	
	ribArray = [[managedObjectContext 
				 executeFetchRequest:request error:&error]
				mutableCopy];
	
	[request release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [ribArray count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	static NSString *CellIdentifier = @"RibbonCellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
	if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
		cell.textLabel.font = [UIFont systemFontOfSize:14.0];
		
		cell.textLabel.textAlignment = UITextAlignmentCenter;
		cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
		cell.textLabel.numberOfLines = 0;
		
    }
   
	Ribbon *rib = (Ribbon *)[ribArray objectAtIndex:indexPath.row];

	cell.textLabel.text = rib.ribbonName;
	cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
	
    BOOL checked = [[rib isRibbonSelected] boolValue];
    UIImage *image = (checked) ? [UIImage imageNamed:@"checked.png"] : [UIImage imageNamed:@"unchecked.png"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    button.frame = frame; 	
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
	[button addTarget:self action:@selector(checkButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
	
	cell.accessoryView = button;
	
	UIImage *ribbon =  [UIImage imageNamed:rib.ribbonImage];
	cell.imageView.image = ribbon;
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	return cell;
}

- (void)checkButtonTapped:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
    if (indexPath != nil)
    {
        [self tableView: self.tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

		return organization.orgName;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{   

	NSError *saveError;
	
	Ribbon *rib = (Ribbon *)[ribArray objectAtIndex:indexPath.row];
    
	BOOL checked = [[rib isRibbonSelected] boolValue];
	
	[rib setIsRibbonSelected:[NSNumber numberWithBool:!checked]];
    
	if (![managedObjectContext save:&saveError]) {
		
	} else {
		
	}
	
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath: indexPath];
	
    UIButton *button = (UIButton *)cell.accessoryView;
    
    UIImage *newImage = (checked) ? [UIImage imageNamed:@"unchecked.png"] : [UIImage imageNamed:@"checked.png"];
    [button setBackgroundImage:newImage forState:UIControlStateNormal];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
   Ribbon *rib = (Ribbon *)[ribArray objectAtIndex:indexPath.row];
		
	[self.parentViewController.view addSubview:medalInfoView.view];
	
	NSString *path = [[NSString alloc] initWithString:[[[NSBundle mainBundle] resourcePath] 
													   stringByAppendingPathComponent:rib.ribbonImage]];
	
	UIImage *ribimage = [[UIImage alloc] initWithContentsOfFile:path];
	
	medalInfoView.ribbonTitle.text = rib.ribbonName;
	medalInfoView.ribbonTitle.font = [UIFont boldSystemFontOfSize:16.0];
	
	medalInfoView.ribbonDesc.text = rib.ribbonDesc;
    [medalInfoView.ribbonImage setImage:ribimage];
	
	[ribimage release];
	[path release];
	
}

- (IBAction)buildRack {
	
	RackView *rackView = [[RackView alloc] initWithNibName:@"RackView" bundle:[NSBundle mainBundle]];
	rackView.managedObjectContext = self.managedObjectContext;
	rackView.organization = organization;
	
	[self.navigationController pushViewController:rackView animated:YES];
	[rackView release];

  }

- (void)dealloc {

	[medalInfoView release];
	[managedObjectContext release];
	[rackButton release];
	[tableView release];
    [super dealloc];
}


@end

