//
//  ScheduleViewController.m
//  RACMVVMExample
//
//  Created by Pavel Shadrin on 02/02/16.
//  Copyright © 2016 Pavel Shadrin. All rights reserved.
//

#import "ScheduleViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ScoreCell.h"

@interface ScheduleViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UITableView *scoresTableView;

@end


@implementation ScheduleViewController

- (void)dealloc {
    self.scoresTableView.dataSource = nil;
    self.scoresTableView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting up table view
    [self.scoresTableView registerNib:[UINib nibWithNibName:@"ScoreCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    self.scoresTableView.dataSource = self;
    self.scoresTableView.delegate = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [self.scoresTableView addSubview:refreshControl];
    
    // Setting up bindings:
    // Hook pull-to-refresh via RAC
    refreshControl.rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [self.viewModel updateScoresForCurrentDate];
        return [RACSignal empty];
    }];
    
    // Hook buttons
    self.minusButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [self.viewModel moveOneDayBackward];
        return [RACSignal empty];
    }];
    
    self.plusButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [self.viewModel moveOneDayForward];
        return [RACSignal empty];
    }];
    
    // Hook changes in view model
    [RACObserve(self.viewModel, scores) subscribeNext:^(id x) {
        [self.scoresTableView reloadData];
    }];
    
    // Hook date changes
    RAC(self.dateLabel, text) = RACObserve(self.viewModel, currentDateText);
    
    [self.viewModel updateScoresForCurrentDate];
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.scores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScoreCell *cell = (ScoreCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.viewModel = self.viewModel.scores[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68.0;
}

@end
