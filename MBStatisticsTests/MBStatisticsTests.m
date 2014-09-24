//
//  MBStatisticsTests.m
//  MBStatisticsTests
//
//  Created by Patrick Perini on 9/24/14.
//  Copyright (c) 2014 megabits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MBStatDistribution.h"

@interface MBStatisticsTests : XCTestCase

@end

@implementation MBStatisticsTests

- (void)testPolarRandomNumbers {
    
    int max = INT_MIN;
    for (NSInteger i = 0; i < 100000000; i++) {
        int x = (int)[MBStatDistribution randomNumberWithDistribution: MBStatDistributionTypeNormal
                                                                 mean: 3
                                                    standardDeviation: 6
                                                            algorithm: MBStatDistributionAlgorithmPolar
                                                              clamped: NSMakeRange(0, INT_MAX)];
        
        if (x > max) {
            max = x;
        }
    }
    
    NSLog(@"\nmax: %d\n", max);
    XCTAssertGreaterThan(max, INT_MIN);
}

@end
