//
//  HNTextActivityIndicator.h
//  HNTextActivityIndicator
//
//  Created by Josh Chung on 3/23/13.
//  Copyright (c) 2013 minorblend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNTextActivityIndicator : UILabel

@property (assign, nonatomic) BOOL hidesWhenStopped;
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorStyle;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSString *sequence;

- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

@end
