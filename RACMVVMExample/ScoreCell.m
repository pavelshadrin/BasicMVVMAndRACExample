//
//  ScoreCell.m
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import "ScoreCell.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ScoreCell ()

@property (weak, nonatomic) IBOutlet UILabel *firstTeamLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTeamLabel;

@property (weak, nonatomic) IBOutlet UILabel *firstScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondScoreLabel;

@end


@implementation ScoreCell

- (void)setViewModel:(ScoreCellViewModel *)viewModel {
    if (_viewModel == viewModel) {
        return;
    }
    
    _viewModel = viewModel;
    
    RAC(self.firstTeamLabel, text) = [RACObserve(self.viewModel, firstTeamName) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.secondTeamLabel, text) = [RACObserve(self.viewModel, secondTeamName) takeUntil:self.rac_prepareForReuseSignal];
    
    RAC(self.firstScoreLabel, text) = [[RACObserve(self.viewModel, firstTeamScore) map:^id(NSNumber *score) {
        return [NSString stringWithFormat:@"%@", score];
    }] takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.secondScoreLabel, text) = [[RACObserve(self.viewModel, secondTeamScore) map:^id(NSNumber *score) {
        return [NSString stringWithFormat:@"%@", score];
    }] takeUntil:self.rac_prepareForReuseSignal];
}

@end
