//
//  FeaturesAPIClient.h
//  SampleApp
//
//  Created by Yuta YOSHIIKE on 2014/02/14.
//  Copyright (c) 2014年 Yuta YOSHIIKE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface FeaturesAPIClient : AFHTTPSessionManager

- (void)fetchFeature:(NSString *)featureId;

@end
