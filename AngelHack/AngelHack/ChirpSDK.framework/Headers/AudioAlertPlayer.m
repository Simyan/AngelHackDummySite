/*------------------------------------------------------------------------------
 *
 *  This file is part of the Chirp SDK for iOS.
 *  For full information on usage and licensing, see http://chirp.io/
 *
 *  Copyright © 2011-2017, Asio Ltd.
 *  All rights reserved.
 *
 *----------------------------------------------------------------------------*/

#import "AudioAlertPlayer.h"

#import <AVFoundation/AVFoundation.h>

#define AUDIO_SUCCESS_ALERT  @"beep-positive"
#define AUDIO_FAILURE_ALERT  @"beep-negative"

#define AUDIO_TYPE            @"wav"

@interface AudioAlertPlayer ()

@property (strong) AVAudioPlayer *successSound;
@property (strong) AVAudioPlayer *failureSound;

@end

@implementation AudioAlertPlayer

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    NSString *path;
    NSURL *url;
    
    /*----------------------------------------------------------------------------*
     * Load a sound to indicate successful receipt of chirp.
     *----------------------------------------------------------------------------*/
    path = [[NSBundle mainBundle] pathForResource:AUDIO_SUCCESS_ALERT ofType:AUDIO_TYPE];
    url = [[NSURL alloc] initFileURLWithPath:path];
    
    self.successSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    self.successSound.volume = 0.7;
    [self.successSound prepareToPlay];
    
    /*----------------------------------------------------------------------------*
     * Load a sound to indicate failure
     *----------------------------------------------------------------------------*/
    path = [[NSBundle mainBundle] pathForResource:AUDIO_FAILURE_ALERT ofType:AUDIO_TYPE];
    url = [[NSURL alloc] initFileURLWithPath:path];
    
    self.failureSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    self.failureSound.volume = 0.7;
    [self.failureSound prepareToPlay];
    
    return self;
}

- (void)success
{
    [self.successSound play];
}

- (void)failure
{
    [self.failureSound play];
}


@end
