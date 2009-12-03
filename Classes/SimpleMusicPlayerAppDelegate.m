//
//  SimpleMusicPlayerAppDelegate.m
//  SimpleMusicPlayer
//
//  Created by cybercom on 09-12-2.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SimpleMusicPlayerAppDelegate.h"
#import "SimpleMusicPlayerViewController.h";

@implementation SimpleMusicPlayerAppDelegate

@synthesize window;
@synthesize playViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	SimpleMusicPlayerViewController *aViewController = [[SimpleMusicPlayerViewController alloc] init];
	self.playViewController = aViewController;
	[aViewController release];
	[window addSubview:playViewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[playViewController release];
    [window release];
    [super dealloc];
}


@end
