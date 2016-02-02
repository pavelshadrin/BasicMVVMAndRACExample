//
//  ScheduleViewModel.h
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ScoreCellViewModel.h"

@interface ScheduleViewModel : NSObject

+ (instancetype)scheduleViewModelWithDate:(NSDate *)date;

@property (nonatomic, strong, readonly) NSArray<ScoreCellViewModel *> *scores;

@property (nonatomic, strong, readonly) NSString *currentDateText;

- (void)moveOneDayForward;
- (void)moveOneDayBackward;

- (void)updateScoresForCurrentDate;

@end
