//
//  TicTacToe.h
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Player.h"
#import "Board.h"

#define Player1Char 'X'
#define Player2Char 'O'


char board[3][3];

typedef struct  {
	int x;
	int y;
}Move;

typedef NS_ENUM(NSInteger, GameType) {
    AVA,
    AVP,
    PVP,
};

typedef void(^GameOverBlock)(void);
@interface TicTacToe : NSObject


@property (nonatomic,strong)GameOverBlock gameOverBlock;

@property (nonatomic)Player *player1;

@property (nonatomic)Player *player2;

@property (nonatomic,weak)Player *nextPlayer;

@property (nonatomic)BOOL gameFinished;

@property (nonatomic)GameType type;

@property (nonatomic,weak)Board *borad;

- (void)nextTurn;

- (void)tryMoveTo:(Coordinate*)cord perform:(void(^)(Coordinate* moveTo))move;

- (void)startWithGameType:(GameType)type;


- (BOOL)gameOver;

- (int)score;


- (void)marktMove:(Coordinate*)cord ;
@end
