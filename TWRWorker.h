//
//  TWRWorker.h
//  Dispatching
//
//  Created by Michelangelo Chasseur on 24/05/14.
//  Copyright (c) 2014 Touchware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWRWorker : NSObject

- (void)logString:(NSString *)string times:(NSUInteger)times;
- (void)logString:(NSString *)string afterDelay:(NSTimeInterval)seconds;
- (void)finally;
- (void)finallyAsync;

@end
