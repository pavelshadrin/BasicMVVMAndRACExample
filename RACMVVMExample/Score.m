//
//  Score.m
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import "Score.h"


@interface Score ()

@property (nonatomic, strong) NSString *firstTeamName;
@property (nonatomic, strong) NSString *secondTeamName;

@property (nonatomic) NSInteger firstTeamScore;
@property (nonatomic) NSInteger secondTeamScore;

// other things that are not shown in the cells but belong to model:
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *venue;
@property (nonatomic, strong) NSString *broadcaster;

@end


@implementation Score

+ (instancetype)scoreWithFirstTeamName:(NSString *)firstTeamName
                        secondTeamName:(NSString *)secondTeamName
                        firstTeamScore:(NSInteger)firstTeamScore
                       secondTeamScore:(NSInteger)secondTeamScore
                                  date:(NSDate *)date
                                 venue:(NSString *)venue
                           broadcaster:(NSString *)broadcaster {
    Score *score = [Score new];
    
    score.firstTeamName = firstTeamName;
    score.secondTeamName = secondTeamName;
    
    score.firstTeamScore = firstTeamScore;
    score.secondTeamScore = secondTeamScore;
    
    score.date = date;
    score.venue = venue;
    score.broadcaster = broadcaster;
    
    return score;
}

@end
