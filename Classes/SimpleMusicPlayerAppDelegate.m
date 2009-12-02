//
//  SimpleMusicPlayerAppDelegate.m
//  SimpleMusicPlayer
//
//  Created by cybercom on 09-12-2.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SimpleMusicPlayerAppDelegate.h"

@implementation SimpleMusicPlayerAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
