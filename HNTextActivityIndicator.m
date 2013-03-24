//
//  HNTextActivityIndicator.m
//  HNTextActivityIndicator
//
//  Created by Josh Chung on 3/23/13.
//  Copyright (c) 2013 minorblend. All rights reserved.
//

#import "HNTextActivityIndicator.h"

@interface HNTextActivityIndicator ()

- (void)nextCharacter;

@end

@implementation HNTextActivityIndicator {
  BOOL _isAnimating;
  NSInteger _currentIndex;
  NSTimer *_timer;
}

- (id)init
{
  return [self initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
}

- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
  switch (style) {
    case UIActivityIndicatorViewStyleWhite:
    case UIActivityIndicatorViewStyleGray:
      self = [super initWithFrame:CGRectMake(0, 0, 20, 20)];
      break;
    case UIActivityIndicatorViewStyleWhiteLarge:
      self = [super initWithFrame:CGRectMake(0, 0, 37, 37)];
      break;
    default:
      self = [super init];
  }

  if (self) {
    self.activityIndicatorStyle = style;
    self.sequence = @"-\\|/";
    self.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = [UIColor clearColor];
    self.opaque = YES;
    switch (style) {
      case UIActivityIndicatorViewStyleWhite:
        self.color = [UIColor whiteColor];
        self.font = [UIFont fontWithName:@"Courier New" size:17];
        break;
      case UIActivityIndicatorViewStyleGray:
        self.color = [UIColor grayColor];
        self.font = [UIFont fontWithName:@"Courier New" size:17];
        break;
      case UIActivityIndicatorViewStyleWhiteLarge:
        self.color = [UIColor whiteColor];
        self.font = [UIFont fontWithName:@"Courier New" size:30];
        break;
      default:
        break;
    }
    self.hidesWhenStopped = YES;
    self.hidden = YES;
    _isAnimating = NO;
  }

  return self;
}

- (void)dealloc
{
  if (_timer && _timer.isValid)
    [_timer invalidate];
}

- (void)setColor:(UIColor *)color
{
  _color = color;
  self.textColor = color;
}

- (void)startAnimating
{
  if (_isAnimating || !self.superview)
    return;

  _isAnimating = YES;
  self.hidden = NO;

  if (_timer && _timer.isValid)
    [_timer invalidate];

  _timer = [NSTimer scheduledTimerWithTimeInterval:0.15f
                                            target:self
                                          selector:@selector(nextCharacter)
                                          userInfo:nil
                                           repeats:YES];
  [_timer fire];
}

- (void)stopAnimating
{
  _isAnimating = NO;

  self.hidden = self.hidesWhenStopped;
  if (_timer && _timer.isValid)
    [_timer invalidate];
}

- (BOOL)isAnimating
{
  return _isAnimating;
}

- (void)nextCharacter
{
  if (++_currentIndex >= self.sequence.length)
    _currentIndex = 0;

  self.text = [self.sequence substringWithRange:NSMakeRange(_currentIndex, 1)];
}

@end
