//
//  ScoreCellViewModel.m
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import "ScoreCellViewModel.h"

@interface ScoreCellViewModel ()

@property (nonatomic, strong) Score *score;

@property (nonatomic, strong) NSString *firstTeamName;
@property (nonatomic, strong) NSString *secondTeamName;

@property (nonatomic) NSInteger firstTeamScore;
@property (nonatomic) NSInteger secondTeamScore;

@end


@implementation ScoreCellViewModel

+ (instancetype)scoreCellViewModelWithScore:(Score *)score {
    ScoreCellViewModel *vm = [ScoreCellViewModel new];
    
    vm.score = score;
    
    vm.firstTeamName = score.firstTeamName;
    vm.secondTeamName = score.secondTeamName;
    
    vm.firstTeamScore = score.firstTeamScore;
    vm.secondTeamScore = score.secondTeamScore;
    
    return vm;
}

@end
