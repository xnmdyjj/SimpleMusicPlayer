//
//  SimpleMusicPlayerViewController.h
//  SimpleMusicPlayer
//
//  Created by cybercom on 09-12-3.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface SimpleMusicPlayerViewController : UIViewController <AVAudioPlayerDelegate>{
	UIButton *playButton;
	UIButton *pauseButton;
	UIButton *stopButton;
	UIButton *ffwButton;
	UIButton *rewButton;
	UISlider *volumeSlider;
	UISlider *progressBar;
	UILabel *currentTime;
	UILabel *fileDuration;
	
	NSTimer *updateTimer;
	NSTimer *ffwTimer;
	NSTimer *rewTimer;
	
	AVAudioPlayer *audioPlayer;
	
}

@property (nonatomic,retain) UIButton *playButton;
@property (nonatomic,retain) UIButton *pauseButton;
@property (nonatomic,retain) UIButton *stopButton;
@property (nonatomic, retain) UIButton *ffwButton;
@property (nonatomic, retain) UIButton *rewButton;
@property (nonatomic,retain) UISlider *volumeSlider;
@property (nonatomic, retain) UISlider *progressBar;
@property (nonatomic, retain) UILabel *currentTime;
@property (nonatomic, retain) UILabel *fileDuration;
@property (nonatomic, retain) NSTimer *updateTimer;
@property (nonatomic, retain) NSTimer *ffwTimer;
@property (nonatomic, retain) NSTimer *rewTimer;
@property (nonatomic,retain) AVAudioPlayer *audioPlayer;

-(void)playButtonPressed:(id)sender;
-(void)pauseButtonPressed:(id)sender;
-(void)stopButtonPressed:(id)sender;
-(void)ffwButtonPressed:(id)sender;
-(void)ffwButtonReleased:(id)sender;
-(void)rewButtonPressed:(id)sender;
-(void)volumeSliderMoved:(id)sender;

@end
