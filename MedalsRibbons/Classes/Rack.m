//
//  Rack.m
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/15/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import "Rack.h"
#import "Ribbon.h"

@implementation Rack

@synthesize array;

-(id)initWithArray:(NSMutableArray *)rackArray{
	self = [super init];
	if(self != nil)
	{
		self.array = rackArray;
		self.backgroundColor = [UIColor lightGrayColor];
	
	}   
	return self;
	
}

- (void)drawRect:(CGRect)rect {

	CGContextRef context = UIGraphicsGetCurrentContext();
	
	float horizontal = (self.center.x / 2.0 );
	float vertical = (self.center.y /8.0);
	
	float x = horizontal ;
	float y = vertical;
	
	float yOffSet = 0.0 ;
	float xOffSet = 0.0;
	
	
	while([array count] > 0)
	{
		
		int top = [array count] % 3;
		
		if(top == 0)
		{
			top = 3;
		}
		
		for (int i = 0; i < top; i++) {
			
			NSString *imgPath = [[NSBundle mainBundle] pathForResource:[[array lastObject]ribbonImage]
																ofType:nil];
			UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
			
			if(top == 2 && xOffSet == 0.0 )
			{
				xOffSet = (img.size.width / 2);
				x = x + xOffSet;
			}
			
			if(top == 1 && xOffSet == 0.0 )
			{
				xOffSet = (img.size.width);
				x = x + xOffSet;
			}
			
			CGRect imageRect;
			imageRect.origin = CGPointMake(x,y);
			imageRect.size = CGSizeMake(img.size.width,img.size.height);
			
	
			if(yOffSet == 0.0)
			{
				yOffSet = img.size.height;
			}
			
			  image = CGImageRetain(img.CGImage);
			
			  CGContextDrawImage(context, imageRect, image);
			
			x = x + img.size.width;
			
			[array removeLastObject];
		}
		
		x = horizontal;
		y = y + yOffSet;
		
	}
	
}


- (void)dealloc {
	CGImageRelease(image);
    [super dealloc];
}


@end
