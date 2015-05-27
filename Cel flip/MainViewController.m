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
    
    
    self.images = @[[UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image2"], [UIImage imageNamed:@"image3"], [UIImage imageNamed:@"image4"], [UIImage imageNamed:@"image5"], [UIImage imageNamed:@"image6"], [UIImage imageNamed:@"image7"], [UIImage imageNamed:@"image8"], [UIImage imageNamed:@"image9"], [UIImage imageNamed:@"image10"], [UIImage imageNamed:@"image11"], [UIImage imageNamed:@"image12"], [UIImage imageNamed:@"image13"], [UIImage imageNamed:@"image14"], [UIImage imageNamed:@"image15"]];
    
    [self.tableView reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell loadWithImage:self.images[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    // Animation 1
//    // Source: https://gist.github.com/RebornSoul/8123997
//    
//    if (tableView.isDragging) {
//        UIView *myView = cell.contentView;
//        CALayer *layer = myView.layer;
//        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
//        rotationAndPerspectiveTransform.m34 = 1.0 / -1000;
//        if (scrollOrientation == UIImageOrientationDown) {
//            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, M_PI*0.5, 1.0f, 0.0f, 0.0f);
//        } else {
//            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -M_PI*0.5, 1.0f, 0.0f, 0.0f);
//        }
//        layer.transform = rotationAndPerspectiveTransform;
//        [UIView animateWithDuration:.9 animations:^{
//            layer.transform = CATransform3DIdentity;
//        }];
//    }
    
//    // Animation 2
//    // Source: http://www.thinkandbuild.it/animating-uitableview-cells/
//    
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    rotation.m34 = 1.0/ -600;
//    
//    
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    
//    //3. Define the final state (After the animation) and commit the animation
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.4];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
    

    // Animation 3
    // Source: http://zurb.com/forrst/posts/UITableView_flipping_cells-mOs
    [UIView beginAnimations:@"FlipCellAnimation" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cell cache:YES];
    
    [cell removeFromSuperview];
    [self.tableView addSubview:cell];
    
    [UIView commitAnimations];
    
    
//    // Animation 4
//    // Source: https://gist.github.com/leviathan/7801501
//    // Setup initial state (e.g. before animation)
//    cell.layer.shadowColor = [[UIColor blackColor] CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5);
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    // Define final state (e.g. after animation) & commit animation
//    [UIView beginAnimations:@"scaleTableViewCellAnimationID" context:NULL];
//    [UIView setAnimationDuration:0.7];
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    cell.alpha = 1;
//    cell.layer.transform = CATransform3DIdentity;
//    [UIView commitAnimations];
}

@end
