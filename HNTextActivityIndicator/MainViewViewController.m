//
//  MainViewViewController.m
//  HNTextActivityIndicator
//
// This is under The MIT License
//
// Copyright © 2013 Josh Ha-Nyung Chung <minorblend@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#import "MainViewViewController.h"

#import "HNTextActivityIndicator.h"

@interface MainViewViewController ()

- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;

@end

@implementation MainViewViewController {
  HNTextActivityIndicator *_spinner;
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  CGPoint center = CGPointMake(floorf(CGRectGetWidth(self.view.frame) / 2), floorf(CGRectGetHeight(self.view.frame) / 2));

  _spinner = [[HNTextActivityIndicator alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
  _spinner.center = center;
  [self.view addSubview:_spinner];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
  if (_spinner)
    [_spinner startAnimating];
}

- (IBAction)stop:(id)sender {
  if (_spinner)
    [_spinner stopAnimating];
}
@end
