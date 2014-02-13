//
//  ViewController.m
//  SampleApp
//
//  Created by Yuta YOSHIIKE on 2014/02/14.
//  Copyright (c) 2014年 Yuta YOSHIIKE. All rights reserved.
//

#import "ViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url  = [[NSURL alloc] initWithString:@"http://features.apiary.io/"];
    self.client = [[FeaturesAPIClient alloc] initWithBaseURL: url];
}

- (void)viewDidAppear:(BOOL)animated
{
    [SVProgressHUD show];
    
    [self.client GET:@"api/v1/features/52f854ddddf814c7ea000001"
          parameters:nil
             success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSArray *resources = [responseObject objectForKey:@"resources"];
         
         NSArray *conditionals = [[resources firstObject] objectForKey:@"conditionals"];
         
         NSLog(@"conditionals %@", conditionals);
         
         NSDictionary *device = @{@"osType": @"iOS"};
         
         NSString *op = [[conditionals firstObject] objectForKey:@"operator"];
         NSLog(@"op %@", op);
         
         NSString *type = [[conditionals firstObject] objectForKey:@"type"];
         NSLog(@"type %@", type);
         
         NSString *value = [[conditionals firstObject] objectForKey:@"value"];
         NSLog(@"value %@", value);
         
         if ([op isEqualToString:@"="]) {
             NSLog(@"%@", op);
             BOOL isAAA = [[device objectForKey:type] isEqualToString:value];
             NSLog(@"%d", isAAA);
             [SVProgressHUD dismiss];
         }
     }
             failure:^(NSURLSessionDataTask *task, NSError *error)
     {
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
