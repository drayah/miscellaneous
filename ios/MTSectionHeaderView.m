//
//  MTSectionHeaderView.m
//  Metro
//
//  Created by Giovanni Martina on 9/1/13.
//  Copyright (c) 2013 Giovanni Martina. All rights reserved.
//

#import "MTSectionHeaderView.h"

#define TOGGLE_ANIMATION_DURATION 0.1
#define TOGGLE_ANIMATION_DELAY 0

@interface MTSectionHeaderView ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation MTSectionHeaderView

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
    }
    
    return _gradientLayer;
}

- (void)awakeFromNib {
    [self setupHeaderView];
}

- (void)setupHeaderView {
    //setup tap gesture recognizer
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggle)];
    [self addGestureRecognizer:tapRecognizer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.gradientLayer.frame = self.bounds;
}

- (void)createBackgroundGradient {
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.colors = @[(id) self.gradientStart.CGColor, (id) self.gradientEnd.CGColor];
    [self.contentView.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)updateToggleOrientation {
    //set correct orientation of toggle button
    [self rotateToggleButtonWithAnimation:NO];
}

- (void)toggle {
    //inform our delegate that we performed a toggle
    if ([self.delegate isSectionOpen:self.section]) {
        [self.delegate didCloseSection:self.section forSectionHeaderView:self];
    }
    else {
        [self.delegate didOpenSection:self.section forSectionHeaderView:self];
    }
    
    //animate and rotate the toggle button
    [self rotateToggleButtonWithAnimation:YES];
}

- (void)rotateToggleButtonWithAnimation:(BOOL)animate {
    CGAffineTransform transform;
    
    if ([self.delegate isSectionOpen:self.section]) {
        //section is open now, set the rotation transformation matrix on the button
        transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    else {
        //section is closed now, reset the transformation matrix on the button
        transform = CGAffineTransformIdentity;
    }
    
    if (animate) {
        //do the animation
        [UIView animateWithDuration:TOGGLE_ANIMATION_DURATION
                              delay:TOGGLE_ANIMATION_DELAY
                            options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.sectionToggleButton.transform = transform;
                         }
                         completion:NULL];
    }
    else {
        self.sectionToggleButton.transform = transform;
    }
}

@end
