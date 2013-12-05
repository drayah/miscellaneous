//
//  MTSectionHeaderView.h
//  Metro
//
//  Created by Giovanni Martina on 9/1/13.
//  Copyright (c) 2013 Giovanni Martina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTSectionHeaderView;

@protocol MTSectionHeaderViewDelegate <NSObject>
- (BOOL)isSectionOpen:(NSUInteger)section;
- (void)didOpenSection:(NSUInteger)section forSectionHeaderView:(MTSectionHeaderView *)sectionHeaderView;
- (void)didCloseSection:(NSUInteger)section forSectionHeaderView:(MTSectionHeaderView *)sectionHeaderView;
@end

@interface MTSectionHeaderView : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *sectionTitleLabel;
@property (nonatomic, weak) IBOutlet UIButton *sectionToggleButton;
@property (nonatomic, strong) UIColor *gradientStart;
@property (nonatomic, strong) UIColor *gradientEnd;
@property (nonatomic, weak) id <MTSectionHeaderViewDelegate> delegate;
@property (nonatomic) NSUInteger section;

- (void)createBackgroundGradient;
- (void)updateToggleOrientation;

@end
