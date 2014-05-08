//
//  Player.m
//  TicTactToe
//
//  Created by alexander on 5/5/14.
//  Copyright (c) 2014 Uriphium. All rights reserved.
//

#import "Player.h"
#import "Board.h"
#import "Coordinate.h"
#import "TicTacToe.h"
@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.role = PlayerHuman;
    }
    return self;
}


- (void)markBoard:(Board*)board atCoordinate:(Coordinate*)cord{
    
    SKSpriteNode* node = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(CellSize, CellSize)];
    
    node.position = [cord centerInBoard];
    
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    
    label.fontColor = [UIColor whiteColor];
    
    label.text = self.identifer;
    
    [node addChild:label];
    
    [board addChild:node];
}



- (void)startTurn:(char[3][3])AIboard{

    
    
    if (self.trunProgress==PlayerTrunProgressWaiting) {
        
        
        self.trunProgress = PlayerTrunProgressPlaying;
        
        self.opponent.trunProgress = PlayerTrunProgressWaiting;
        
        
        if (self.role==PlayerAI) {
            
            NSLog(@"AI %@ move",self.identifer);
            
            Move AImove = [self minimax:AIboard];
            
            [_game tryMoveTo:[[Coordinate alloc] initWithMove:AImove] perform:nil];
        }

    }

}

-(Move) minimax:(char[3][3])AIboard {
    
	int bestMoveScore = 100; // -100 is arbitrary
    
	Move bestMove = {0,0};
    
	for(int i = 0; i < 3; i++) {
		for(int j = 0; j < 3; j++) {
			if(AIboard[i][j] == '-') {
   
				AIboard[i][j] = [self.identifer characterAtIndex:0];
                
				int tempMoveScore = [self maxSearch:AIboard];
                
				if(tempMoveScore <= bestMoveScore) {

                    bestMoveScore = tempMoveScore;
                    bestMove.x = i;
                    bestMove.y = j;
				}
                
				AIboard[i][j] = '-';
			}
		}
	}
    
	return bestMove;
}

- (int)maxSearch:(char [3][3])AIboard {
    
	if([_game gameOver])
        return [_game score];
    
	Move bestMove;
    
	int bestMoveScore = -1000;
    
	for(int i = 0; i < 3; i++) {
        
		for(int j = 0; j < 3; j++) {
            
			if(AIboard[i][j] == '-') {
                
				AIboard[i][j] = [self.opponent.identifer characterAtIndex:0];;
                
				int tempMoveScore =[self minSearch:AIboard];

				if(tempMoveScore >= bestMoveScore) {
                    
                    bestMoveScore = tempMoveScore;
                    bestMove.x = i;
                    bestMove.y = j;
                    
				}
				AIboard[i][j] = '-';
			}
		}
	}
    
	return bestMoveScore;
}

- (int)minSearch:(char [3][3])AIboard {
	if([_game gameOver])
        return [_game score];
    
	Move bestMove;
    
	int bestMoveScore = 1000;
    
	for(int i = 0; i < 3; i++) {
		for(int j = 0; j < 3; j++) {
			if(AIboard[i][j] == '-') {
                
				AIboard[i][j] = [self.identifer characterAtIndex:0];
                
				int tempMove =[self maxSearch:AIboard];

				if(tempMove <= bestMoveScore) {
                    
					bestMoveScore = tempMove;
					bestMove.x = i;
					bestMove.y = j;
				}
                
				AIboard[i][j] = '-';
			}
		}
	}
    
	return bestMoveScore;
}




@end
