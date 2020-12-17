//
//  SuccessViewController.h
//  SampleLoginMeuID
//
//  Created by Paulo Rosa on 08/12/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuccessViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeVerifierLabel;

- (void)setParametersFromURL:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END
