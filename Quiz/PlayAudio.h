//
//  PlayAudio.h
//  Quiz
//
//  Created by Daniel Brennan on 30/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenAl/al.h>
#import <OpenAl/alc.h>
#include <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

//@import AVFoundation;

@interface PlayAudio : NSObject

- (void) playSound;
- (void) preloadAudioSample:(NSString*)filename;


+ (AVAudioSession *)sharedInstance;

@end
