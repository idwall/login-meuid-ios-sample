//
//  ViewController.h
//  SampleLoginMeuID
//
//  Created by Idwall on 27/11/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)didTapLogin:(UIButton *)sender;
@end

