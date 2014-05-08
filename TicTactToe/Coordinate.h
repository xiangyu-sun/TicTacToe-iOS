//
//  Coordinate.h
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TicTacToe.h"
@interface Coordinate : NSObject
@property (nonatomic)CGFloat x;
@property (nonatomic)CGFloat y;

-(CGPoint)centerInBoard;

- (instancetype)initWithPoint:(CGPoint)p;

- (instancetype)initWithMove:(Move)move;
@end
