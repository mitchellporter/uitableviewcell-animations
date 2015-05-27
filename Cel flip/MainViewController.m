//
//  MainViewController.m
//  Cel flip
//
//  Created by Mitchell Porter on 5/26/15.
//  Copyright (c) 2015 Mentor Ventures, Inc. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource> {
    UIImageOrientation scrollOrientation;
    CGPoint lastPos;
}


@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property NSArray *data;
@property NSArray *backgroundColors;
@property NSArray *images;


@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Table view
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.bounces = YES;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.pagingEnabled = YES;
    
    NSLog(@"frame: %@", NSStringFromCGRect(self.tableView.frame));
    
    
    self.data = @[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    self.backgroundColors = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor grayColor], [UIColor blackColor]];
    self.images = @[[UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image2"], [UIImage imageNamed:@"image3"], [UIImage imageNamed:@"image4"], [UIImage imageNamed:@"image5"], [UIImage imageNamed:@"image6"], [UIImage imageNamed:@"image7"], [UIImage imageNamed:@"image8"]];
    
    [self.tableView reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell loadWithImage:self.images[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [UIView beginAnimations:@"FlipCellAnimation" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cell cache:YES];
    
    [cell removeFromSuperview];
    
    
    [self.tableView addSubview:cell];
    
    
    [UIView commitAnimations];
}

@end
