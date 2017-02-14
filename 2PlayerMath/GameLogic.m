//
//  GameLogic.m
//  2PlayerMath
//
//  Created by Ali Barış Öztekin on 2017-02-13.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "GameLogic.h"
#import "Player.h"

@interface GameLogic()

@property (nonatomic) NSInteger answer;
@property (nonatomic) NSInteger playerAnswer;


@property (nonatomic,strong) Player* player1;
@property (nonatomic,strong) Player* player2;
@property (nonatomic,strong) NSArray* playerArray;
@property (nonatomic) NSInteger currentPlayerIndex;



@property (nonatomic) NSInteger rand1;
@property (nonatomic) NSInteger rand2;

@end
@implementation GameLogic

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateQuestionAndResetPlayerInput];
        _player1 = [Player new];
        _player2 = [Player new];
        _playerArray = [NSArray arrayWithObjects:_player1,_player2, nil];
        _currentPlayerIndex = 0;
    }
    return self;
}

-(NSString*) generateQuestionAndResetPlayerInput
{
    self.rand1 = arc4random_uniform(20)+1;
    self.rand2 = arc4random_uniform(20)+1;
    self.answer = self.rand1+self.rand2;
    self.question =[NSString stringWithFormat:@" %li + %li ?", (long)self.rand1, (long)self.rand2];
    _playerAnswerInput = [NSMutableString new];

    return self.question;

}
-(void)fetchAnswer:(NSString*) tappedNumber
{
    [self.playerAnswerInput appendString:tappedNumber];

}

-(NSInteger) returnCurrentPlayerIndex
{
    
    return self.currentPlayerIndex;
}

-(NSInteger)checkAnswerAndUpdateLife
{
    NSString* parsedAnswer = [NSString stringWithFormat:@"%@", self.playerAnswerInput ];
    self.playerAnswer = [parsedAnswer integerValue];
    if(self.playerAnswer != self.answer)
        [self.playerArray[_currentPlayerIndex] reduceLife];
    NSLog(@"check answer result \n parsed answer %@ actual answer %li",parsedAnswer, self.answer);
    return [self.playerArray[_currentPlayerIndex] life];
    
    
    
}

-(Player*) playerWithIndex:(NSInteger) index
{
    return self.playerArray[index];
}

-(NSString*)switchPlayer
{
    if (_currentPlayerIndex ==0)
    {
        _currentPlayerIndex = 1;
        return @"Player 2:";
    }
    
    
    else
        
    {
        _currentPlayerIndex = 0;
        return @"Player 1:";
    }
    
   }
@end
