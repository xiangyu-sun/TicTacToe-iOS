//
//  Board.m
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

#import "Board.h"

#import "Coordinate.h"
#import "TicTacToe.h"

@implementation Board{
    TicTacToe *_game;
}

- (instancetype)initWithColor:(UIColor *)color size:(CGSize)size
{
    self = [super initWithColor:color size:size];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        self.anchorPoint = CGPointMake(0, 0);
        
        _game = [TicTacToe new];
        
        _game.borad = self;
        
        [_game startWithGameType:AVP];
        
        [_game setGameOverBlock:^(){
           
            [self removeAllChildren];
            
        }];
        
    }
    return self;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
   
    
    CGPoint p = [[touches anyObject] locationInNode:self.parent];
    
    p = CGPointMake(p.x-self.position.x,  p.y-self.position.y);
    
    Coordinate *coord = [[Coordinate alloc] initWithPoint:p];
    
    [_game tryMoveTo:coord perform:^(Coordinate *moveTo) {
    }];
}


@end
