//
//  ViewController.m
//  MusicBebe
//
//  Created by Tan Ophaswongse on 11/14/14.
//  Copyright (c) 2014 Tan Ophaswongse. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIDevice *device;
MPMusicPlayerController *musicPlayer;

- (void)viewDidLoad {
    device = [UIDevice currentDevice];
    [super viewDidLoad];
    device.proximityMonitoringEnabled = YES;
    if (device.proximityMonitoringEnabled == YES){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:@"UIDeviceProximityStateDidChangeNotification" object:device];
    }
    UISwipeGestureRecognizer* swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeftGestureRecognizer.delegate =self;
    swipeLeftGestureRecognizer.numberOfTouchesRequired = 1;
    
    UISwipeGestureRecognizer* swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRightGestureRecognizer.delegate = self;
    swipeRightGestureRecognizer.numberOfTouchesRequired = 1;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    [self.view addGestureRecognizer:swipeLeftGestureRecognizer];
    [self.view addGestureRecognizer:swipeRightGestureRecognizer];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) proximityChanged:(NSNotification *)notification {
    UIDevice *device = [notification object];
    if(device.proximityState){
        NSLog(@"1");
        musicPlayer = [MPMusicPlayerController systemMusicPlayer];
        if (musicPlayer.playbackState == MPMusicPlaybackStatePlaying)
        {
            [musicPlayer pause];
        }
    }else {
        NSLog(@"0");
        if (musicPlayer.playbackState == MPMusicPlaybackStatePaused)
        {
            [musicPlayer play];
        }
    }
    
    
}

//-(void)swipeLeft:(UIGestureRecognizer*)recognizer {
//    NSLog(@"Left");
//    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
//    [musicPlayer skipToPreviousItem];
//    //    if (musicPlayer.playbackState == MPMusicPlaybackStatePlaying)
//    //    {
//    //        [musicPlayer pause];
//    //    }
//}
//
//-(void)swipeRight:(UIGestureRecognizer*)recognizer {
//    NSLog(@"Right");
//    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
//    [musicPlayer skipToNextItem];
//}
//Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIView class]])
    {
        return YES;
    }
    return NO;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    
    if ( sender.direction == UISwipeGestureRecognizerDirectionLeft ){
        
        NSLog(@" *** WRITE CODE FOR SWIPE LEFT ***");
        musicPlayer = [MPMusicPlayerController systemMusicPlayer];
        [musicPlayer skipToNextItem];
        
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        musicPlayer = [MPMusicPlayerController systemMusicPlayer];
        [musicPlayer skipToPreviousItem];
        NSLog(@" *** WRITE CODE FOR SWIPE RIGHT ***");
        
    }
    if ( sender.direction== UISwipeGestureRecognizerDirectionUp ){
        
        NSLog(@" *** WRITE CODE FOR  SWIPE UP ***");
        
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionDown ){
        
        NSLog(@" *** SWIPE DOWN ***");
        
    }
}
//- (IBAction)swipeLeft:(id)sender {
//    NSLog(@"Left");
//    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
//    [musicPlayer skipToPreviousItem];
////    if (musicPlayer.playbackState == MPMusicPlaybackStatePlaying)
////    {
////        [musicPlayer pause];
////    }
//
//}
//
//- (IBAction)swipeRight:(id)sender {
//    NSLog(@"Right");
//    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
//    [musicPlayer skipToNextItem];
//}
-(void) tap:(UITapGestureRecognizer*)tap{
    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
    if(musicPlayer.playbackState == MPMusicPlaybackStatePlaying){
        [musicPlayer pause];
    }else if (musicPlayer.playbackState == MPMusicPlaybackStatePaused){
        [musicPlayer play];
    }
    NSLog(@"Tap");
}
-(void) pan:(UIPanGestureRecognizer*)pan{
    //NSLog(@"Pan");
}
@end
