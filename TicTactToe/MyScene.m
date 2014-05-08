//
//  MyScene.m
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

#import "MyScene.h"


#import "Board.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {

        
        Board *baord =[[Board alloc] initWithColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1] size:CGSizeMake(CellSize*3, CellSize*3)];
        

        [self addChild:baord];
    }
    return self;
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
