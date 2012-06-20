//
//  MedalInfoview.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/24/10.
//  Copyright 2010 My Zizz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MedalInfoView : UIViewController {

	UILabel *ribbonTitle;
	UIImageView *ribbonImage;
	UITextView *ribbonDesc;
	UIButton *cancelButton;
	
}

@property (nonatomic, retain) IBOutlet UILabel *ribbonTitle;
@property (nonatomic, retain) IBOutlet UIImageView *ribbonImage;
@property (nonatomic, retain) IBOutlet UITextView *ribbonDesc;
@property (nonatomic, retain) IBOutlet UIButton *cancelButton;

- (IBAction)closeView ;

@end
