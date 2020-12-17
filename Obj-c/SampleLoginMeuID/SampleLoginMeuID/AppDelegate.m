//
//  AppDelegate.m
//  SampleLoginMeuID
//
//  Created by Idwall on 27/11/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SuccessViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *controller = (ViewController *)self.window.rootViewController;
    self.window.rootViewController = controller;
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSString * storyboardName = @"Success";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    SuccessViewController *successViewController = [storyboard instantiateViewControllerWithIdentifier:@"SuccessViewController"];
    [self.window.rootViewController presentViewController:successViewController animated:YES completion:nil];
    [successViewController setParametersFromURL:url];
    return YES;
}
@end
