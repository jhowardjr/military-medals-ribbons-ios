//
//  RackView.m
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/14/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import "RackView.h"
#import "Ribbon.h"
#import "Rack.h"

@implementation RackView

@synthesize managedObjectContext;
@synthesize organization;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
	
	managedObjectContext = [(RackView *)[[UIApplication sharedApplication] delegate] managedObjectContext];
	
	NSError *error;
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Ribbon" inManagedObjectContext:managedObjectContext];
	
	
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"orgRibbon == %@ && isRibbonSelected == true", organization];
	
	[request setEntity:entity];
	[request setPredicate:predicate];
	
	rackArray = [[managedObjectContext 
				  executeFetchRequest:request error:&error]
				 mutableCopy];

	rackArray = (NSMutableArray *)[[rackArray reverseObjectEnumerator] allObjects];
	
	Rack *rack = [[Rack alloc] initWithArray:rackArray ];
	
	self.view = rack;

	[rack release];

	[request release];
	
}

- (void)dealloc {

	[managedObjectContext release];
	[organization release];
	[rackArray release];
    [super dealloc];
}


@end
