//
//  TWRWorker.m
//  Dispatching
//
//  Created by Michelangelo Chasseur on 24/05/14.
//  Copyright (c) 2014 Touchware. All rights reserved.
//

#import "TWRWorker.h"

@interface TWRWorker ()

@property (strong, nonatomic) dispatch_queue_t workerQueue;
@property (strong, nonatomic) dispatch_group_t workerGroup;

@end

@implementation TWRWorker

- (id)init {
    self = [super init];
    if (self) {
        //do something
        _workerQueue = dispatch_queue_create("re.touchwa.queue", DISPATCH_QUEUE_SERIAL);
        _workerGroup = dispatch_group_create();
    }
    return self;
}

- (void)logString:(NSString *)string times:(NSUInteger)times {
    dispatch_block_t block = ^{
        for (int i=0; i<times; i++)
        {
            NSLog(@"%i: %@", i, string);
        }
    };
    dispatch_group_async(_workerGroup, _workerQueue, block);
}

- (void)logString:(NSString *)string afterDelay:(NSTimeInterval)seconds {
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@", string);
    });
}

- (void)finally {
    dispatch_group_notify(_workerGroup, _workerQueue, ^{
        NSLog(@"### This will run when everything's finished!");
    });
}

- (void)finallyAsync {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"### This will run as soon as it's called!");
    });
}

@end
