//
//  ViewController.h
//  MusicBebe
//
//  Created by Tan Ophaswongse on 11/14/14.
//  Copyright (c) 2014 Tan Ophaswongse. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MediaPlayer;

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    IBOutlet UIImageView *artworkImageView;
     MPMusicPlayerController *musicPlayer;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *artistLabel;
    IBOutlet UILabel *albumLabel;
}

@property(nonatomic, copy) MPMediaItem *nowPlayingItem;
//- (IBAction)swipeLeft:(id)sender;
//- (IBAction)swipeRight:(id)sender;
@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;

- (IBAction)volumeChanged:(id)sender;
- (IBAction)showMediaPicker:(id)sender;
- (IBAction)previousSong:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)nextSong:(id)sender;

- (void) registerMediaPlayerNotifications;

@end


