//
//  MainTableViewCell.m
//  Cel flip
//
//  Created by Mitchell Porter on 5/26/15.
//  Copyright (c) 2015 Mentor Ventures, Inc. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)loadWithImage:(UIImage *)image
{
    self.imageView.image = image;
    self.contentView.layer.contents = (__bridge id)(image.CGImage);
    
}


@end
