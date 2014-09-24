//
//  MBStatDistribution.m
//  MBStatistics
//
//  Created by Patrick Perini on 9/24/14.
//  Copyright (c) 2014 megabits. All rights reserved.
//

#import "MBStatDistribution.h"
#import "MBStatMacros.h"

@interface MBStatDistribution ()

+ (CGFloat)boxMullerRandomNumberWithMean:(CGFloat)mean stdDev:(CGFloat)stdDev;
+ (CGFloat)polarRandomNumberWithMean:(CGFloat)mean stdDev:(CGFloat)stdDev;

@end

@implementation MBStatDistribution

+ (CGFloat)randomNumberWithDistribution:(MBStatDistributionType)distributionType mean:(CGFloat)mean standardDeviation:(CGFloat)stdDev algorithm:(MBStatDistributionAlgorithm)algorithm {
    return [self randomNumberWithDistribution: distributionType
                                         mean: mean
                            standardDeviation: stdDev
                                    algorithm: algorithm
                                      clamped: NSMakeRange(-1, 0)];
}

+ (CGFloat)randomNumberWithDistribution:(MBStatDistributionType)distributionType mean:(CGFloat)mean standardDeviation:(CGFloat)stdDev algorithm:(MBStatDistributionAlgorithm)algorithm clamped:(NSRange)clampRange {
    CGFloat randomNumber = -1;
    switch (distributionType) {
        case MBStatDistributionTypeNormal: {
            switch (algorithm) {
                case MBStatDistributionAlgorithmBoxMuller: {
                    randomNumber = [self boxMullerRandomNumberWithMean: mean stdDev: stdDev];
                }
                    
                case MBStatDistributionAlgorithmPolar: {
                    randomNumber = [self polarRandomNumberWithMean: mean stdDev: stdDev];
                }
            }
            
            break;
        }
            
        default: {
            randomNumber = -1;
        }
    }
    
    if (clampRange.location != -1) {
        randomNumber = MIN(MAX(clampRange.location, randomNumber), clampRange.location + clampRange.length);
    }
    
    return randomNumber;
}

+ (CGFloat)boxMullerRandomNumberWithMean:(CGFloat)mean stdDev:(CGFloat)stdDev {
    return sqrt(-2.0 * log(randdbl(FLT_EPSILON, 1))) * cos(2.0 * M_PI * randdbl(FLT_EPSILON, 1)) * stdDev + mean;
}

+ (CGFloat)polarRandomNumberWithMean:(CGFloat)mean stdDev:(CGFloat)stdDev {
    CGFloat u1, u2, w, multiplier;
    static CGFloat x1, x2;
    static BOOL call = NO;
    
    if (call) {
        call = !call;
        return (mean + stdDev * x2);
    }
    
    do {
        u1 = -1 + (randdbl(FLT_EPSILON, 1)) * 2;
        u2 = -1 + (randdbl(FLT_EPSILON, 1)) * 2;
        
        w = pow(u1, 2) + pow(u2, 2);
    } while (w >= 1 || w == 0);
    
    multiplier = sqrt((-2 * log(w)) / w);
    x1 = u1 * multiplier;
    x2 = u2 * multiplier;
    
    call = !call;
    return (mean + stdDev * x1);
}

@end
