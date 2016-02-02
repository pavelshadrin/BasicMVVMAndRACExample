//
//  ScoreCell.h
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ScoreCellViewModel.h"

@interface ScoreCell : UITableViewCell

@property (nonatomic, strong) ScoreCellViewModel *viewModel;

@end
