//
//  SimpleMusicPlayerViewController.m
//  SimpleMusicPlayer
//
//  Created by cybercom on 09-12-3.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SimpleMusicPlayerViewController.h"
#import "SimpleMusicPlayerView.h"


@implementation SimpleMusicPlayerViewController

@synthesize playButton;
@synthesize pauseButton;
@synthesize stopButton;
@synthesize audioPlayer;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	SimpleMusicPlayerView *aView = [[SimpleMusicPlayerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view = aView;
	[aView release];
	
	//create playbutton
	self.playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	playButton.frame = CGRectMake(0, 0, 60, 60);
	playButton.backgroundColor = [UIColor clearColor];
	[playButton setTitle:@"Play" forState:UIControlStateNormal];
	[playButton addTarget:self action:@selector(playButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:playButton];
	
	//create pauseButton;	
	self.pauseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	pauseButton.frame = CGRectMake(100, 100, 60, 60);
	pauseButton.backgroundColor = [UIColor clearColor];
	[pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
	[pauseButton addTarget:self action:@selector(pauseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:pauseButton];
	
	//create stopButton
	self.stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	stopButton.frame = CGRectMake(200, 200, 60, 60);
	stopButton.backgroundColor = [UIColor clearColor];
	[stopButton setTitle:@"Stop" forState:UIControlStateNormal];
	[stopButton addTarget:self action:@selector(stopButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:stopButton];
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Burning.mp3", [[NSBundle mainBundle] resourcePath]]];	
	self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	


}

-(void)playButtonPressed:(id)sender {
	NSLog(@"play music");
	[self.audioPlayer play];
}

-(void)pauseButtonPressed:(id)sender {
	NSLog(@"pause");
	[self.audioPlayer pause];
}

-(void)stopButtonPressed:(id)sender {
	
	NSLog(@"stop");
	[self.audioPlayer stop];
}

- (void)dealloc {
	[audioPlayer release];
	[playButton release];
	[pauseButton release];
	[stopButton release];
    [super dealloc];
}


@end
