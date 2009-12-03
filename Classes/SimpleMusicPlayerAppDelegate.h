//
//  SimpleMusicPlayerAppDelegate.h
//  SimpleMusicPlayer
//
//  Created by cybercom on 09-12-2.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleMusicPlayerViewController;

@interface SimpleMusicPlayerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SimpleMusicPlayerViewController *playViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) SimpleMusicPlayerViewController *playViewController;

@end

