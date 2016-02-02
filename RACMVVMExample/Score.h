//
//  Score.h
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Score : NSObject

@property (nonatomic, strong, readonly) NSString *firstTeamName;
@property (nonatomic, strong, readonly) NSString *secondTeamName;

@property (nonatomic, readonly) NSInteger firstTeamScore;
@property (nonatomic, readonly) NSInteger secondTeamScore;

// other things that are not shown in the cells but belong to model:
@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSString *venue;
@property (nonatomic, strong, readonly) NSString *broadcaster;


+ (instancetype)scoreWithFirstTeamName:(NSString *)firstTeamName
                        secondTeamName:(NSString *)secondTeamName
                        firstTeamScore:(NSInteger)firstTeamScore
                       secondTeamScore:(NSInteger)secondTeamScore
                                  date:(NSDate *)date
                                 venue:(NSString *)venue
                           broadcaster:(NSString *)broadcaster;

@end
