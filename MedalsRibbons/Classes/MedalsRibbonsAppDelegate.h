//
//  MedalsRibbonsAppDelegate.h
//  MedalsRibbons
//
//  Created by johnathan.howard on 11/5/10.
//  Copyright My Zizz 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@class BranchView;

@interface MedalsRibbonsAppDelegate : NSObject <UIApplicationDelegate> {

    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

    UIWindow *window;
	BranchView *branchView;
	IBOutlet UINavigationController *navigationController;
}

- (NSString *)applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) BranchView *branchView;
@end

