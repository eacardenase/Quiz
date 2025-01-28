//
//  ViewController.h
//  Quiz
//
//  Created by Edwin Cardenas on 27/01/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) UILabel *questionLabel;
@property (nonatomic) UILabel *answerLabel;

@property (nonatomic) UIButton *showQuestionButton;
@property (nonatomic) UIButton *showAnswerButton;

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

- (void)showQuestion:(id)sender;
- (void)showAnswer:(id)sender;

@end

