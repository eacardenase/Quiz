//
//  ViewController.m
//  Quiz
//
//  Created by Edwin Cardenas on 27/01/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _questions = @[
            @"From what is cognac made?",
            @"What is 7+7?",
            @"What is the capital of Vermont?",
        ];
        _answers = @[
            @"Grapes",
            @"14",
            @"Montpelier",
        ];
        _currentQuestionIndex = 0;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
    NSLog(@"%@", self.questions);
    NSLog(@"%@", self.answers);
}

- (UILabel *)questionLabel
{
    if (!_questionLabel) {
        _questionLabel = [UILabel new];
        _questionLabel.text = self.questions[self.currentQuestionIndex];
        _questionLabel.textAlignment = NSTextAlignmentCenter;
        _questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _questionLabel;
}

- (UIButton *)showQuestionButton
{
    if (!_showQuestionButton) {
        _showQuestionButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_showQuestionButton setTitle:@"Next Question" forState:UIControlStateNormal];
        _showQuestionButton.backgroundColor = [UIColor systemGray5Color];
        [_showQuestionButton addTarget:self action:@selector(showQuestion:) forControlEvents:UIControlEventTouchUpInside];
        _showQuestionButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _showQuestionButton;
}

- (UILabel *)answerLabel
{
    if (!_answerLabel) {
        _answerLabel = [UILabel new];
        _answerLabel.text = @"???";
        _answerLabel.textAlignment = NSTextAlignmentCenter;
        _answerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _answerLabel;
}

- (UIButton *)showAnswerButton
{
    if (!_showAnswerButton) {
        _showAnswerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_showAnswerButton setTitle:@"Show Answer" forState:UIControlStateNormal];
        _showAnswerButton.backgroundColor = [UIColor systemGray5Color];
        [_showAnswerButton addTarget:self action:@selector(showAnswer:) forControlEvents:UIControlEventTouchUpInside];
        
        _showAnswerButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _showAnswerButton;
}

- (void)setupViews
{
    [self.view addSubview:self.questionLabel];
    [self.view addSubview:self.showQuestionButton];
    [self.view addSubview:self.answerLabel];
    [self.view addSubview:self.showAnswerButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.questionLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.questionLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [self.questionLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        
        [self.showQuestionButton.topAnchor constraintEqualToAnchor:self.questionLabel.bottomAnchor constant:20],
        [self.showQuestionButton.leadingAnchor constraintEqualToAnchor:self.questionLabel.leadingAnchor],
        [self.showQuestionButton.trailingAnchor constraintEqualToAnchor:self.questionLabel.trailingAnchor],
        
        [self.answerLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.answerLabel.leadingAnchor constraintEqualToAnchor:self.questionLabel.leadingAnchor],
        [self.answerLabel.trailingAnchor constraintEqualToAnchor:self.questionLabel.trailingAnchor],
        
        [self.showAnswerButton.topAnchor constraintEqualToAnchor:self.answerLabel.bottomAnchor constant:20],
        [self.showAnswerButton.leadingAnchor constraintEqualToAnchor:self.questionLabel.leadingAnchor],
        [self.showAnswerButton.trailingAnchor constraintEqualToAnchor:self.questionLabel.trailingAnchor],
    ]];
}

#pragma mark - Actions

- (void)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (void)showAnswer:(id)sender
{
    if ([self.questionLabel.text isEqualToString:@""]) {
        return;
    }
    
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
}

@end
