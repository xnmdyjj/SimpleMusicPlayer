//
//  SimpleMusicPlayerViewController.h
//  SimpleMusicPlayer
//
//  Created by cybercom on 09-12-3.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface SimpleMusicPlayerViewController : UIViewController {
	UIButton *playButton;
	UIButton *pauseButton;
	UIButton *stopButton;
	
	AVAudioPlayer *audioPlayer;

}

@property (nonatomic,retain) UIButton *playButton;
@property (nonatomic,retain) UIButton *pauseButton;
@property (nonatomic,retain) UIButton *stopButton;
@property (nonatomic,assign) AVAudioPlayer *audioPlayer;

-(void)playButtonPressed:(id)sender;
-(void)pauseButtonPressed:(id)sender;
-(void)stopButtonPressed:(id)sender;

@end
