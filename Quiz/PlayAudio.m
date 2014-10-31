////
////  PlayAudio.m
////  Quiz
////
////  Created by Daniel Brennan on 30/10/2014.
////  Copyright (c) 2014 Daniel Brennan. All rights reserved.
////
////http://ohno789.blogspot.co.uk/2013/08/openal-on-ios.html
//
//
#import "PlayAudio.h"
//
//#define kMaxConcurrentSources 32
//#define kMaxBuffers 256
//
@implementation PlayAudio
@end
//
//static ALCdevice *openALDevice;
//static ALCcontext *openALContext;
//
//static NSMutableArray *audioSampleSources;
//static NSMutableDictionary *audioSampleBuffers;
//
//
//+ (AVAudioSession *)sharedInstance{
//    
//    AVAudioSession *x = [[AVAudioSession alloc] init];
//    
//    
//    
//    return x;
//}
//
//
//
//
//- (id)init
//{
//    self = [super init];
//    if (self)
//    {
//        
//        
////        AudioSessionInitialize(NULL, NULL, AudioInterruptionListenerCallback, NULL);
////        
////        UInt32 session_category = kAudioSessionCategory_MediaPlayback;
////        AudioSessionSetProperty(kAudioSessionProperty_AudioCategory, sizeof(session_category), &session_category);
////        
////        AudioSessionSetActive(true);
//        
//        openALDevice = alcOpenDevice(NULL);
//        
//        openALContext = alcCreateContext(openALDevice, NULL);
//        alcMakeContextCurrent(openALContext);
//        
//        NSUInteger sourceID;
//        for (int i = 0; i < kMaxConcurrentSources; i++) {
//            /* Create a single OpenAL source */
//            alGenSources(1, &sourceID);
//            /* Add the source to the audioSampleSources array */
//            [audioSampleSources addObject:[NSNumber numberWithUnsignedInt:sourceID]];
//        }
//        
//    }
//    return self;
//}
//
//void AudioInterruptionListenerCallback(void* user_data, UInt32 interruption_state)
//{
//    if (kAudioSessionBeginInterruption == interruption_state)
//    {
//        alcMakeContextCurrent(NULL);
//    }
//    else if (kAudioSessionEndInterruption == interruption_state)
//    {
////        AudioSessionSetActive(true);
//        alcMakeContextCurrent(openALContext);
//    }
//}
//
//- (void) playSound
//{
//    NSUInteger sourceID;
//    alGenSources(1, &sourceID);
//    
//    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"ting" ofType:@"caf"];
//    NSURL *audioFileURL = [NSURL fileURLWithPath:audioFilePath];
//    
//    AudioFileID afid;
//    OSStatus openAudioFileResult = AudioFileOpenURL((__bridge CFURLRef)audioFileURL, kAudioFileReadPermission, 0, &afid);
//    
//    if (0 != openAudioFileResult)
//    {
//        NSLog(@"An error occurred when attempting to open the audio file %@: %d", audioFilePath, (int)openAudioFileResult);
//        return;
//    }
//    
//    UInt64 audioDataByteCount = 0;
//    UInt32 propertySize = sizeof(audioDataByteCount);
//    OSStatus getSizeResult = AudioFileGetProperty(afid, kAudioFilePropertyAudioDataByteCount, &propertySize, &audioDataByteCount);
//    
//    if (0 != getSizeResult)
//    {
//        NSLog(@"An error occurred when attempting to determine the size of audio file %@: %d", audioFilePath, (int)getSizeResult);
//    }
//    
//    UInt32 bytesRead = (UInt32)audioDataByteCount;
//    
//    void *audioData = malloc(bytesRead);
//    
//    OSStatus readBytesResult = AudioFileReadBytes(afid, false, 0, &bytesRead, audioData);
//    
//    if (0 != readBytesResult)
//    {
//        NSLog(@"An error occurred when attempting to read data from audio file %@: %d", audioFilePath, (int)readBytesResult);
//    }
//    
//    AudioFileClose(afid);
//    
//    ALuint outputBuffer;
//    alGenBuffers(1, &outputBuffer);
//    
//    alBufferData(outputBuffer, AL_FORMAT_STEREO16, audioData, bytesRead, 44100);
//    
//    if (audioData)
//    {
//        free(audioData);
//        audioData = NULL;
//    }
//    
//    alSourcef(sourceID, AL_PITCH, 1.0f);
//    alSourcef(sourceID, AL_GAIN, 1.0f);
//    
//    alSourcei(sourceID, AL_BUFFER, outputBuffer);
//    
//    alSourcePlay(sourceID);
//}
//
//- (void) playAudioSample:(NSString *)sampleName
//{
//    ALuint source = [self getNextAvailableSource];
//    
//    alSourcef(source, AL_PITCH, 1.0f);
//    alSourcef(source, AL_GAIN, 1.0f);
//    
//    ALuint outputBuffer = (ALuint)[[audioSampleBuffers objectForKey:sampleName] intValue];
//    
//    alSourcei(source, AL_BUFFER, outputBuffer);
//    
//    alSourcePlay(source);
//}
//
//- (ALuint) getNextAvailableSource
//{
//    ALint sourceState;
//    for (NSNumber *sourceID in audioSampleSources) {
//        alGetSourcei([sourceID unsignedIntValue], AL_SOURCE_STATE, &sourceState);
//        if (sourceState != AL_PLAYING)
//        {
//            return [sourceID unsignedIntValue];
//        }
//    }
//    
//    ALuint sourceID = [[audioSampleSources objectAtIndex:0] unsignedIntegerValue];
//    alSourceStop(sourceID);
//    return sourceID;
//}
//
//- (void) preloadAudioSample:(NSString *)sampleName
//{
//    if ([audioSampleBuffers objectForKey:sampleName])
//    {
//        return;
//    }
//    
//    if ([audioSampleBuffers count] > kMaxBuffers) {
//        NSLog(@"Warning: You are trying to create more than 256 buffers! This is not allowed.");
//        return;
//    }
//    
//    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:sampleName ofType:@"caf"];
//    
//    AudioFileID afid = [self openAudioFile:audioFilePath];
//    
//    UInt32 audioFileSizeInBytes = [self getSizeOfAudioComponent:afid];
//    
//    void *audioData = malloc(audioFileSizeInBytes);
//    
//    OSStatus readBytesResult = AudioFileReadBytes(afid, false, 0, &audioFileSizeInBytes, audioData);
//    
//    if (0 != readBytesResult)
//    {
//        NSLog(@"An error occurred when attempting to read data from audio file %@: %ld", audioFilePath, readBytesResult);
//    }
//    
//    AudioFileClose(afid);
//    
//    ALuint outputBuffer;
//    alGenBuffers(1, &outputBuffer);
//    
//    alBufferData(outputBuffer, AL_FORMAT_STEREO16, audioData, audioFileSizeInBytes, kSampleRate);
//    
//    [audioSampleBuffers setObject:[NSNumber numberWithInt:outputBuffer] forKey:sampleName];
//    
//    if (audioData)
//    {
//        free(audioData);
//        audioData = NULL;
//    }
//}
//
//- (AudioFileID) openAudioFile:(NSString *)audioFilePathAsString
//{
//    NSURL *audioFileURL = [NSURL fileURLWithPath:audioFilePathAsString];
//    
//    AudioFileID afid;
//    OSStatus openAudioFileResult = AudioFileOpenURL((__bridge CFURLRef)audioFileURL, kAudioFileReadPermission, 0, &afid);
//    
//    if (0 != openAudioFileResult)
//    {
//        NSLog(@"An error occurred when attempting to open the audio file %@: %ld", audioFilePathAsString, openAudioFileResult);
//        
//    }
//    
//    return afid;
//}
//
//- (UInt32) getSizeOfAudioComponent:(AudioFileID)afid
//{
//    UInt64 audioDataSize = 0;
//    UInt32 propertySize = sizeof(UInt64);
//    
//    OSStatus getSizeResult = AudioFileGetProperty(afid, kAudioFilePropertyAudioDataByteCount, &propertySize, &audioDataSize);
//    
//    if (0 != getSizeResult)
//    {
//        NSLog(@"An error occurred when attempting to determine the size of audio file.");
//    }
//    
//    return (UInt32)audioDataSize;
//}
//
//- (void) shutdownAudioSamplePlayer
//{
//    ALint source;
//    for (NSNumber *sourceValue in audioSampleSources)
//    {
//        NSUInteger sourceID = [sourceValue unsignedIntValue];
//        alGetSourcei(sourceID, AL_SOURCE_STATE, &source);
//        alSourceStop(sourceID);
//        alDeleteSources(1, &sourceID);
//    }
//    [audioSampleSources removeAllObjects];
//    
//    NSArray *bufferIDs = [audioSampleBuffers allValues];
//    for (NSNumber *bufferValue in bufferIDs)
//    {
//        NSUInteger bufferID = [bufferValue unsignedIntValue];
//        alDeleteBuffers(1, &bufferID);
//    }
//    [audioSampleBuffers removeAllObjects];
//    
//    alcDestroyContext(openALContext);
//    
//    alcCloseDevice(openALDevice);
//}
//
//
//
//@end
