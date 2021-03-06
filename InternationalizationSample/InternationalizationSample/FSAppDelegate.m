//
//  FSAppDelegate.m
//  InternationalizationSample
//
//  Created by Michael Han on 12-03-05.
//  Copyright (c) 2012 ForeSee. All rights reserved.
//

#import "FSAppDelegate.h"
#import "FSViewController.h"
#import <ForeSee/ForeSee.h>

@implementation FSAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc {
  [_window release];
  [_viewController release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  self.viewController = [[[FSViewController alloc] initWithNibName:@"FSViewController" bundle:nil] autorelease];
  
  [self initializeForeSeeTrigger];
  
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)initializeForeSeeTrigger {
  [ForeSee setDebugLogEnabled:YES];
  [ForeSee setSkipPoolingCheck:YES];
  [ForeSee start];
  [ForeSee checkIfEligibleForSurvey];
}

@end
