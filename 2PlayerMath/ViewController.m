//
//  ViewController.m
//  2PlayerMath
//
//  Created by Ali Barış Öztekin on 2017-02-13.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "ViewController.h"
#import "GameLogic.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) GameLogic* gameLogic;
@property (weak, nonatomic) IBOutlet UILabel *PlayerNumber;
@property (weak, nonatomic) IBOutlet UILabel *player1Life;
@property (weak, nonatomic) IBOutlet UILabel *player2Life;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameLogic = [GameLogic new];
    self.question.text = [self.gameLogic question];
    self.PlayerNumber.text =@"Player 1:";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapNumber:(UIButton *)sender {
    NSString* tappedNumber = sender.currentTitle;
    NSLog(@"tapped number%@",tappedNumber);
    [self.gameLogic fetchAnswer:tappedNumber];
    NSLog(@"player answer input %@", self.gameLogic.playerAnswerInput);
}

- (IBAction)tapEnter:(id)sender {
    NSInteger updateLife = [self.gameLogic checkAnswerAndUpdateLife];
    NSString* updateLabel =[NSString stringWithFormat:@"%ld",(long)updateLife];
    
    if (([self.gameLogic returnCurrentPlayerIndex])) {
        self.player1Life.text = updateLabel;
    }
    else{
        self.player2Life.text = updateLabel;
    }
    self.PlayerNumber.text = [self.gameLogic switchPlayer];
    self.question.text = [self.gameLogic generateQuestionAndResetPlayerInput];
}

@end
