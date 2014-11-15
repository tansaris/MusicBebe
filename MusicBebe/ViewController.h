//
//  ViewController.h
//  MusicBebe
//
//  Created by Tan Ophaswongse on 11/14/14.
//  Copyright (c) 2014 Tan Ophaswongse. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MediaPlayer;

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
@property(nonatomic, readonly) MPMusicPlayerController* playbackController;
//- (IBAction)swipeLeft:(id)sender;
//- (IBAction)swipeRight:(id)sender;


@end

