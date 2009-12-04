//
//  SimpleMusicPlayerViewController.m
//  SimpleMusicPlayer
//
//  Created by cybercom on 09-12-3.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SimpleMusicPlayerViewController.h"
#import "SimpleMusicPlayerView.h"


@interface SimpleMusicPlayerViewController(PrivateMethods)
-(void)updateViewForPlayerInfo;
-(void)updateViewForPlayerState;
-(void)updateCurrentTime;
@end


@implementation SimpleMusicPlayerViewController

@synthesize playButton;
@synthesize pauseButton;
@synthesize stopButton;
@synthesize audioPlayer;
@synthesize volumeSlider;
@synthesize progressBar;
@synthesize currentTime;
@synthesize fileDuration;
@synthesize updateTimer;

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
	playButton.frame = CGRectMake(20, 380, 60, 60);
	playButton.backgroundColor = [UIColor clearColor];
	[playButton setTitle:@"Play" forState:UIControlStateNormal];
	[playButton addTarget:self action:@selector(playButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:playButton];
	
	//create pauseButton;	
	self.pauseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	pauseButton.frame = CGRectMake(130, 380, 60, 60);
	pauseButton.backgroundColor = [UIColor clearColor];
	[pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
	[pauseButton addTarget:self action:@selector(pauseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:pauseButton];
	
	//create stopButton
	self.stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	stopButton.frame = CGRectMake(240, 380, 60, 60);
	stopButton.backgroundColor = [UIColor clearColor];
	[stopButton setTitle:@"Stop" forState:UIControlStateNormal];
	[stopButton addTarget:self action:@selector(stopButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:stopButton];
	
	//create volume slider;
	
	UISlider *aSlider = [[UISlider alloc] initWithFrame:CGRectMake(40, 300, 220, 20)];
	self.volumeSlider = aSlider;
	[aSlider release];
	[volumeSlider addTarget:self action:@selector(volumeSliderMoved:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:volumeSlider];
	
	//create time slider;
	UISlider *anotherSlider = [[UISlider alloc] initWithFrame:CGRectMake(40.0, 200.0, 220.0, 20.0)];
	self.progressBar = anotherSlider;
	[anotherSlider release];
	self.progressBar.minimumValue = 0.0;
	[progressBar addTarget:self action:@selector(progressBarMoved:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:progressBar];
	
	//create current time label;	
	UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 200.0, 20.0, 20.0)];
	self.currentTime = aLabel;
	[aLabel release];
	self.currentTime.adjustsFontSizeToFitWidth = YES;
	[self.view addSubview:currentTime];
	
	//create duration label;
	UILabel *anotherLabel = [[UILabel alloc] initWithFrame:CGRectMake(270.0, 200.0, 20.0, 20.0)];
	self.fileDuration = anotherLabel;
	[anotherLabel release];
	self.fileDuration.adjustsFontSizeToFitWidth = YES;
	[self.view addSubview:fileDuration];
	
	//init timer;
	self.updateTimer = nil;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"sample" ofType: @"m4a"];
	
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
	//NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Burning.mp3", [[NSBundle mainBundle] resourcePath]]];	
	AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
	self.audioPlayer = newPlayer;
	[newPlayer release];
	
	if (self.audioPlayer) {
		[self updateViewForPlayerInfo];
		[self updateViewForPlayerState];
	}
	[fileURL release];
	
	//[self.audioPlayer prepareToPlay];
	//[self.audioPlayer setDelegate:self];
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

-(void)updateViewForPlayerInfo {
	self.fileDuration.text = [NSString stringWithFormat:@"%d:%02d", (int)self.audioPlayer.duration / 60, (int)self.audioPlayer.duration % 60, nil];
	NSLog(@"%f", self.audioPlayer.duration);
	self.progressBar.maximumValue = self.audioPlayer.duration;
	self.volumeSlider.value = self.audioPlayer.volume;
}

-(void)updateViewForPlayerState {
	[self updateCurrentTime];
	
	if (self.updateTimer) {
		[self.updateTimer invalidate];
	}
	
	if (self.audioPlayer.playing) {
		self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(updateCurrentTime) userInfo:self.audioPlayer repeats:YES];
	}
}


-(void)updateCurrentTime {
	self.currentTime.text = [NSString stringWithFormat:@"%d:%02d", (int)self.audioPlayer.currentTime / 60, (int)self.audioPlayer.currentTime % 60, nil];
	self.progressBar.value = self.audioPlayer.currentTime;
}


-(void)playButtonPressed:(id)sender {
	NSLog(@"play music");
	[self.audioPlayer play];
	[self updateViewForPlayerState];
	
}

-(void)pauseButtonPressed:(id)sender {
	NSLog(@"pause");
	[self.audioPlayer pause];
}

-(void)stopButtonPressed:(id)sender {
	
	NSLog(@"stop");
	[self.audioPlayer stop];
}

-(void)volumeSliderMoved:(UISlider *)sender {
	NSLog(@"volumeSliderMoved");
	self.audioPlayer.volume = [sender value];
}

-(void)progressBarMoved:(UISlider *)sender {
	NSLog(@"progressBarMoved");
	
}

- (void) audioPlayerDidFinishPlaying: (AVAudioPlayer *) player
                        successfully: (BOOL) completed {
    if (completed == YES) {
		NSLog(@"did finish palying");
    }
}

- (void)dealloc {
	[audioPlayer release];
	[playButton release];
	[pauseButton release];
	[stopButton release];
	[volumeSlider release];
    [super dealloc];
}


@end
