//
//  ViewController.m
//  SampleLoginMeuID
//
//  Created by Idwall on 27/11/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) NSString *applicationID;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLoginButtonWhiteWithoutBorder];
}

- (void)setupLoginButtonPurple {
    [self.loginButton setTitle: @"Login com MeuID" forState:UIControlStateNormal];
    [self.loginButton setTintColor: UIColor.whiteColor];
    [self.loginButton setBackgroundColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00]];
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.clipsToBounds = YES;
    UIImage *logo = [UIImage imageNamed:@"logo_meuid_white"];
    [self.loginButton setImage:logo forState:UIControlStateNormal];
    [self.loginButton setImageEdgeInsets:UIEdgeInsetsMake(8.0, 0.0, 8.0, 20.0)];
}

- (void)setupLoginButtonWhiteWithBorder {
    [self.loginButton setTitle: @"Login com MeuID" forState:UIControlStateNormal];
    [self.loginButton setTintColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00]];
    [self.loginButton setTitleColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00] forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor: UIColor.whiteColor];
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.layer.borderColor = [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00].CGColor;
    self.loginButton.layer.borderWidth = 1.0;
    self.loginButton.clipsToBounds = YES;
    UIImage *logo = [UIImage imageNamed:@"logo_meuid_purple"];
    [self.loginButton setImage:logo forState:UIControlStateNormal];
    [self.loginButton setImageEdgeInsets:UIEdgeInsetsMake(8.0, 0.0, 8.0, 20.0)];
}

- (void)setupLoginButtonWhiteWithoutBorder {
    [self.loginButton setTitle: @"Login com MeuID" forState:UIControlStateNormal];
    [self.loginButton setTintColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00]];
    [self.loginButton setTitleColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00] forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor: UIColor.whiteColor];
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.clipsToBounds = YES;
    UIImage *logo = [UIImage imageNamed:@"logo_meuid_purple"];
    [self.loginButton setImage:logo forState:UIControlStateNormal];
    [self.loginButton setImageEdgeInsets:UIEdgeInsetsMake(8.0, 0.0, 8.0, 20.0)];
}

- (NSString *)getDeeplink {
    _applicationID = @"c14eb1bd-fda5-4d1a-a7d7-65ccb4b29467";
    return [NSString stringWithFormat:@"meuid://meuid?action=MEUID_AUTHENTICATION&applicationId=%@&parameters=eyJvcmlnaW4iOiJNT0JJTEVfQVBQIn0%%3D", _applicationID];
}

- (IBAction)didTapLogin:(UIButton *)sender {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString: [self getDeeplink]];
    [application openURL:URL options:@{} completionHandler:nil];
}
@end
