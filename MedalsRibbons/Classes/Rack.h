//
//  Rack.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/15/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Rack : UIView {

	CGImageRef image;
	NSMutableArray *array;
}

@property (nonatomic, retain) NSMutableArray *array;

-(id)initWithArray:(NSMutableArray *)rackArray;


@end
