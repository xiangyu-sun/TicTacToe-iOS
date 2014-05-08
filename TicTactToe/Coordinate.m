//
//  Coordinate.m
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

#import "Coordinate.h"
#import "Board.h"
@implementation Coordinate
- (instancetype)initWithPoint:(CGPoint)p{
    self = [super init];
    if (self) {
    
         _x= floor( p.x/CellSize);
        
         _y= floor( p.y/CellSize);
        
        NSLog(@"%f %f",_x,_y);
    }
    return self;
}

- (instancetype)initWithMove:(Move)move{
    self = [super init];
    if (self) {
        
        _x= move.x;
        
        _y= move.y;

    }
    return self;
}


-(CGPoint)centerInBoard{
    CGPoint p = CGPointMake(CellSize*(0.5+_x), CellSize*(0.5+_y));
    return p;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"%i:%i", (int)_x,(int)_y];
}
@end
