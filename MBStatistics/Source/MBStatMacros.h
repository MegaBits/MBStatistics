//
//  MBStatMacros.h
//  MBStatistics
//
//  Created by Patrick Perini on 9/24/14.
//  Copyright (c) 2014 megabits. All rights reserved.
//

#pragma mark - - Random
static int randint(int min, int max) { // Random number in [min, max]
    arc4random_uniform((max - min)); // Throw away
    arc4random_uniform((max - min)); // three
    arc4random_uniform((max - min)); // numbers, to help ensure variance.
    
    return (arc4random_uniform((max - min) + 1) + min);
}

#define randbool() ((randint(0, 2) % 2) == 0) // Random boolean. Either YES or NO
#define randdbl(min, max) ((double)randint(min * 1000000, max * 1000000) / 1000000.0) // Random number in [min, max], floated up to 6 figures
#define randpercent() (randdbl(0, 1)) // Random number in [0, 1], floated 6 figures