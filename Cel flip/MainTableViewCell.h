//
//  MainTableViewCell.h
//  Cel flip
//
//  Created by Mitchell Porter on 5/26/15.
//  Copyright (c) 2015 Mentor Ventures, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *contentImageView;

- (void)loadWithImage:(UIImage *)image;

@end
