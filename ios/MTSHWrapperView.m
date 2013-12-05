//
//  MTSHWrapperView.m
//  Metro
//
//  Created by Giovanni Martina on 9/28/13.
//  Copyright (c) 2013 Giovanni Martina. All rights reserved.
//

#import "MTSHWrapperView.h"

@implementation MTSHWrapperView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if ([self.subviews count] > 0) {
        //need to update child's frame
        //to correctly draw gradient background
        UIView *wrappedView = self.subviews[0];
        wrappedView.frame = self.bounds;
    }
}

@end
