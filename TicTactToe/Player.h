//
//  Player.h
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

@class Board,Coordinate,TicTacToe;

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSInteger, PlayerRole) {
    PlayerAI,
    PlayerHuman,
};

typedef NS_ENUM(NSInteger, PlayerTrunProgress) {
    PlayerTrunProgressWaiting,
    PlayerTrunProgressPlaying,
};

@interface Player : NSObject

@property (nonatomic)PlayerRole role;

@property (nonatomic)PlayerTrunProgress trunProgress;

@property (nonatomic)NSString *identifer;

@property (nonatomic,weak)Player *opponent;

@property (nonatomic,weak)TicTacToe *game;


- (void)startTurn:(char[3][3])AIboard;


- (void)markBoard:(Board*)board atCoordinate:(Coordinate*)cord;

@end
