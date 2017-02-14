//
//  GameLogic.h
//  2PlayerMath
//
//  Created by Ali Barış Öztekin on 2017-02-13.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@interface GameLogic : NSObject

@property (nonatomic,strong) NSString* question;
@property (nonatomic,strong) NSMutableString* playerAnswerInput;

-(void)fetchAnswer:(NSString*) tappedNumber;
-(NSInteger)checkAnswerAndUpdateLife;
-(NSString*) generateQuestionAndResetPlayerInput;
-(Player*) playerWithIndex:(NSInteger) index;
-(NSInteger) returnCurrentPlayerIndex;
-(NSString*)switchPlayer;

@end
