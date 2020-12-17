//
//  SuccessViewController.m
//  SampleLoginMeuID
//
//  Created by Paulo Rosa on 08/12/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()

@end

@implementation SuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setParametersFromURL:(NSURL *)url {
    NSString *code = [self queryParametersFromURL:url][@"code"];
    NSString *codeVerifier = [self queryParametersFromURL:url][@"code_verifier"];
    self.codeLabel.text = [_codeLabel.text stringByAppendingString:code];
    self.codeVerifierLabel.text = [_codeVerifierLabel.text stringByAppendingString:codeVerifier];
}

- (NSDictionary<NSString *, NSString *> *)queryParametersFromURL:(NSURL *)url {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    NSMutableDictionary<NSString *, NSString *> *queryParams = [NSMutableDictionary<NSString *, NSString *> new];
    for (NSURLQueryItem *queryItem in [urlComponents queryItems]) {
        if (queryItem.value == nil) { continue; }
        [queryParams setObject:queryItem.value forKey:queryItem.name];
    }
    return queryParams;
}
@end
