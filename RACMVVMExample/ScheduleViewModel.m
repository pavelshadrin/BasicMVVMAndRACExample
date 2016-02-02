//
//  ScheduleViewModel.m
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import "ScheduleViewModel.h"

@interface ScheduleViewModel ()

@property (nonatomic, strong) NSArray<ScoreCellViewModel *> *scores;

@property (nonatomic, strong) NSDate *currentDate;
@property (nonatomic, strong) NSString *currentDateText;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end


@implementation ScheduleViewModel

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _scores = [NSArray array];
        
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateStyle = NSDateFormatterShortStyle;
        _dateFormatter.timeStyle = NSDateFormatterNoStyle;
        
        @weakify(self);
        RAC(self, currentDateText) = [RACObserve(self, currentDate) map:^id(NSDate *date) {
            @strongify(self);
            return [self.dateFormatter stringFromDate:date];
        }];
    }
    
    return self;
}

+ (instancetype)scheduleViewModelWithDate:(NSDate *)date {
    ScheduleViewModel *vm = [[self alloc] init];
    
    vm.currentDate = date;
    
    return vm;
}

- (void)updateScoresForCurrentDate {
    [self clearData];
    [self downloadScoresForDate:_currentDate];
}

- (void)moveOneDayForward {
    self.currentDate = [self.currentDate dateByAddingTimeInterval:60 * 60 * 24];
    [self updateScoresForCurrentDate];
}

- (void)moveOneDayBackward {
    self.currentDate = [self.currentDate dateByAddingTimeInterval:-60 * 60 * 24];
    [self updateScoresForCurrentDate];
}

#pragma mark - Private

- (void)clearData {
    self.scores = [NSArray array];
}


#pragma mark - Network

- (void)downloadScoresForDate:(NSDate *)date {
    // TODO: put network code here: all the business logic, persistence, network code should be placed inside VM, not view or view controller
    
    // imitate 1 sec delay for network; but without canceling
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.scores = [self randomScores];
    });
}


#pragma mark - Debug helpers

// Mock what could be returned from network operations and transformed into view models
- (NSArray<ScoreCellViewModel *> *)randomScores {
    int r = arc4random() % 3;
    
    if (r == 0) {
        return @[
                 [ScoreCellViewModel scoreCellViewModelWithScore:
                  [Score scoreWithFirstTeamName:@"LAL" secondTeamName:@"BOS" firstTeamScore:70 secondTeamScore:88 date:nil venue:@"TD Garden" broadcaster:@"ESPN"]],
                 [ScoreCellViewModel scoreCellViewModelWithScore:[Score scoreWithFirstTeamName:@"LAL" secondTeamName:@"NYK" firstTeamScore:90 secondTeamScore:87 date:nil venue:@"MSG" broadcaster:@"FOX"]]
                 ];
    } else if (r == 1) {
        return @[
                 [ScoreCellViewModel scoreCellViewModelWithScore:
                  [Score scoreWithFirstTeamName:@"MEM" secondTeamName:@"BOS" firstTeamScore:116 secondTeamScore:100 date:nil venue:@"TD Garden" broadcaster:@"FOX"]],
                 [ScoreCellViewModel scoreCellViewModelWithScore:[Score scoreWithFirstTeamName:@"LAL" secondTeamName:@"LAC" firstTeamScore:91 secondTeamScore:77 date:nil venue:@"Staples Center" broadcaster:@"FOX"]]
                 ];
    } else {
        return @[
                 [ScoreCellViewModel scoreCellViewModelWithScore:
                  [Score scoreWithFirstTeamName:@"LAL" secondTeamName:@"UTA" firstTeamScore:103 secondTeamScore:88 date:nil venue:@"ES Arena" broadcaster:@"ESPN"]],
                 [ScoreCellViewModel scoreCellViewModelWithScore:[Score scoreWithFirstTeamName:@"CLE" secondTeamName:@"NYK" firstTeamScore:99 secondTeamScore:88 date:nil venue:@"MSG" broadcaster:@"ESPN"]]
                 ];
    }
}

@end
