//
//  TicTacToe.m
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

#import "TicTacToe.h"
#import "Coordinate.h"





@implementation TicTacToe{
    NSInteger _trun;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _player1 = [Player new];
        _player1.identifer = [NSString  stringWithFormat:@"%c",Player1Char];

        
        _player2 = [Player new];
        _player2.identifer = [NSString  stringWithFormat:@"%c",Player2Char];;
        
        
        _player1.opponent = _player2;
        
        
        _player2.opponent = _player1;
        
        _player2.game = self;
        
        _player1.game = self;
        
    }
    return self;
}
- (void)tryMoveTo:(Coordinate*)cord perform:(void(^)(Coordinate* moveTo))move{
    NSLog(@"try %@",cord);
    
    if (board[(int)cord.x][(int)cord.y] == '-') {
        
        if (move) {
             move(cord);
        }

        [self.nextPlayer markBoard:_borad atCoordinate:cord];
        
        [self marktMove:cord];
        
        [self nextTurn];
        
        NSLog(@"goon next");
    }else{
        NSLog(@"!!!!%c",board[(int)cord.x][(int)cord.y]);
        NSLog(@"------FAILED-------------");
        for(int i = 0; i <3; i++) {
            NSMutableString *line =[NSMutableString string];
            [line appendString:@"|"];
            for(int j = 0; j < 3; j++) {
                [line appendFormat:@"%c|", board[i][j]] ;
            }
            NSLog(@"%@",line);
        }
        NSLog(@"-------------------");

    }
}
- (void)startWithGameType:(GameType)type{
    
    _type = type;
    
    switch (type) {
        case AVA:
            _player2.role = _player1.role = PlayerAI;
            break;
        case AVP:
            _player2.role = PlayerAI;
            break;
        default:
           
            break;
    }
    
     [self reset];
    
     [self nextTurn];
}
- (void)marktMove:(Coordinate*)cord {
    
	board[(int)cord.x][(int)cord.y] = [_nextPlayer.identifer characterAtIndex:0];

    
    NSLog(@"-------------------");
    for(int i = 0; i <3; i++) {
        NSMutableString *line =[NSMutableString string];
        [line appendString:@"|"];
        
        for(int j = 0; j < 3; j++) {
            [line appendFormat:@"%c|", board[i][j]] ;
        }
        NSLog(@"%@",line);
    }
    NSLog(@"-------------------");
    
    
    if ([self checkWin:_player1] ) {
        NSLog(@"1 win");
        self.gameFinished = YES;
    }else if ([self checkWin:_player2]){
        NSLog(@"2 win");
        self.gameFinished = YES;
    }else if([self gameOver]){
        NSLog(@"draw");
        self.gameFinished = YES;
    }
}
- (void)setGameFinished:(BOOL)gameFinished{
    _gameFinished = gameFinished;
    if (self.gameOverBlock&&_gameFinished) {
        self.gameOverBlock();
    }
}
- (void)reset{
    self.gameFinished = NO;
    _nextPlayer = nil;
    _trun = 0;
    
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 3; j++) {
            board[i][j] = '-';
        }
    }
}
- (void)nextTurn{
    

    _trun++;
    
    NSLog(@"%i: last step its %@",_trun,_nextPlayer.identifer);
    
    
    if (self.gameFinished) {
        [self reset];
        return;
    }
    
    if (_nextPlayer) {
        
        _nextPlayer = _nextPlayer.opponent;
        
        [_nextPlayer startTurn:board];
    }else{
        
        _nextPlayer=_player1;
        
        [_nextPlayer startTurn:board];
    }
    
}

- (BOOL)gameOver{
    if([self checkWin:_player1]) return true;
	else if([self checkWin:_player2]) return true;
    
	bool emptySpace = false;
	for(int i = 0; i < 3; i++) {
		if(board[i][0] == '-' || board[i][1] == '-' || board[i][2] == '-')
			emptySpace = true;
	}
	return !emptySpace;
}

- (BOOL)checkWin:(Player*)player{
    char playerChar = [player.identifer characterAtIndex:0];

	for(int i = 0; i < 3; i++) {
		// Check horizontals
		if(board[i][0] == playerChar && board[i][1] == playerChar
           && board[i][2] == playerChar)
			return true;
        
		// Check verticals
		if(board[0][i] == playerChar && board[1][i] == playerChar
           && board[2][i] == playerChar)
			return true;
	}
    
	// Check diagonals
	if (board[0][0] == playerChar && board[1][1] == playerChar
		&& board[2][2] == playerChar) {
		return true;
	} else if (board[0][2] == playerChar && board[1][1] == playerChar
               && board[2][0] == playerChar) {
		return true;
	}
    
	return false;
}
- (int)score{
    if([self checkWin:_player1]) { return 10; }
	else if([self checkWin:_player1.opponent]) { return -10; }
	return 0; // draw
}

@end
