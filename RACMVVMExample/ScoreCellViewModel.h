//
//  ScoreCellViewModel.h
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Score.h"


@interface ScoreCellViewModel : NSObject

@property (nonatomic, strong, readonly) Score *score;

@property (nonatomic, strong, readonly) NSString *firstTeamName;
@property (nonatomic, strong, readonly) NSString *secondTeamName;

@property (nonatomic, readonly) NSInteger firstTeamScore;
@property (nonatomic, readonly) NSInteger secondTeamScore;

+ (instancetype)scoreCellViewModelWithScore:(Score *)score;

@end
