//
//  MedalInfoview.m
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/24/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import "MedalInfoView.h"


@implementation MedalInfoView

@synthesize ribbonTitle;
@synthesize ribbonDesc;
@synthesize ribbonImage;
@synthesize cancelButton;


- (void)viewDidLoad {
	
	[self.view setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.3f]];

	[self.view setFrame:CGRectMake(0, 0, 320, 480)];
}

- (IBAction)closeView {

	[self.view removeFromSuperview];
	
}

- (void)dealloc {
	[cancelButton  release];
	[ribbonImage release];
	[ribbonDesc release];
	[ribbonTitle release];
    [super dealloc];
}


@end
