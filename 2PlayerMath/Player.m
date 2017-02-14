//
//  Player.m
//  2PlayerMath
//
//  Created by Ali Barış Öztekin on 2017-02-13.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init{
    self = [super init];
    if (self) {
        _life = 3;
    }
    return self;
}
-(NSInteger)reduceLife{
    return _life--;
}
@end

