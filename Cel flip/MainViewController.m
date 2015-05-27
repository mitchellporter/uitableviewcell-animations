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
    
    // Source: http://www.thinkandbuild.it/animating-uitableview-cells/

    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];

}

@end
