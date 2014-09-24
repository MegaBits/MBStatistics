//
//  MBStatDistribution.h
//  MBStatistics
//
//  Created by Patrick Perini on 9/24/14.
//  Copyright (c) 2014 megabits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef enum {
    MBStatDistributionTypeNormal
} MBStatDistributionType;

typedef enum {
    MBStatDistributionAlgorithmBoxMuller,
    MBStatDistributionAlgorithmPolar
} MBStatDistributionAlgorithm;

@interface MBStatDistribution : NSObject

+ (CGFloat)randomNumberWithDistribution:(MBStatDistributionType)distributionType mean:(CGFloat)mean standardDeviation:(CGFloat)stdDev algorithm:(MBStatDistributionAlgorithm)algorithm;
+ (CGFloat)randomNumberWithDistribution:(MBStatDistributionType)distributionType mean:(CGFloat)mean standardDeviation:(CGFloat)stdDev algorithm:(MBStatDistributionAlgorithm)algorithm clamped:(NSRange)clampRange;

@end
