//
//  AppDelegate.m
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import "AppDelegate.h"

#import "ScheduleViewModel.h"
#import "ScheduleViewController.h"

@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Root view model should be created in App delegate. We know from storyboard that the root view controller is Schedule
    ScheduleViewModel *scheduleViewModel = [ScheduleViewModel scheduleViewModelWithDate:[NSDate date]];
    ScheduleViewController *viewController = (ScheduleViewController *)self.window.rootViewController;
    viewController.viewModel = scheduleViewModel;

    return YES;
}

@end
