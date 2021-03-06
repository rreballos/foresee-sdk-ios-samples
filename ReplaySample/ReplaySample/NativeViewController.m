//
//  NativeViewController.m
//  ReplaySample
//
//  Created by Selwyn Leeke on 2014-01-14.
//  Copyright (c) 2014 ForeSee. All rights reserved.
//

#import "NativeViewController.h"

@import ForeSeeReplay;

@interface NativeViewController ()

@property (nonatomic, getter = isLabelMasked) BOOL labelMasked;
@property (nonatomic, getter = areTextViewsMasked) BOOL textViewsMasked;

@end

@implementation NativeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Initialize masking statuses
  self.labelMasked = NO;
  self.textViewsMasked = YES;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (IBAction)maskLabel:(id)sender {
  self.labelMasked = !self.isLabelMasked;

  if (self.isLabelMasked) {
    // Mask view
    [ForeSeeReplay maskView:self.label];
    [self.labelButton setTitle:@"Unmask Label" forState:UIControlStateNormal];
  }
  else {
    // Unmask view
    [ForeSeeReplay unmaskView:self.label];
    [self.labelButton setTitle:@"Mask Label" forState:UIControlStateNormal];
  }
}

- (IBAction)unmaskTextViews:(id)sender {
  self.textViewsMasked = !self.areTextViewsMasked;

  if (self.areTextViewsMasked) {
    // Mask views
    [ForeSeeReplay maskView:self.textField];
    [ForeSeeReplay maskView:self.textView];
    [self.textViewButton setTitle:@"Unmask Text Views" forState:UIControlStateNormal];
  }
  else {
    // Unmask views
    [ForeSeeReplay unmaskView:self.textField];
    [ForeSeeReplay unmaskView:self.textView];
    [self.textViewButton setTitle:@"Mask Text Views" forState:UIControlStateNormal];
  }
}

- (IBAction)toggleDebugMasking:(id)sender {
  [ForeSeeReplay setMaskingDebugEnabled:!(bool)[ForeSeeReplay isMaskingDebugEnabled]];
}

@end
