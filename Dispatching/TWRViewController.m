//
//  TWRViewController.m
//  Dispatching
//
//  Created by Michelangelo Chasseur on 24/05/14.
//  Copyright (c) 2014 Touchware. All rights reserved.
//

#import "TWRViewController.h"
#import "TWRWorker.h"

@interface TWRViewController ()

@property (strong, nonatomic) TWRWorker *worker;

@end

@implementation TWRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.worker = [TWRWorker new];
    
    [self.worker logString:@"Hello, world!" times:2000];
    [self.worker logString:@"Hello, world!" times:2000];
    
    // Will run after the previous methods have returned
    [self.worker finally];
    
    // Will run straight away
    [self.worker finallyAsync];
    
    // Will run after 5 seconds
    [self.worker logString:@"This will run after 5 seconds!" afterDelay:5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
