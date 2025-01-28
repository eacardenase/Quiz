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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
}

- (void)setupViews
{
    self.questionField = [UILabel new];
    self.questionField.text = @"";
    self.questionField.textAlignment = NSTextAlignmentCenter;
    
    self.showQuestionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.showQuestionButton setTitle:@"Show Question" forState:UIControlStateNormal];
    self.showQuestionButton.backgroundColor = [UIColor systemGray5Color];
    [self.showQuestionButton addTarget:self action:@selector(showQuestion:) forControlEvents:UIControlEventTouchUpInside];
    
    self.answerField = [UILabel new];
    self.answerField.text = @"???";
    self.answerField.textAlignment = NSTextAlignmentCenter;
    
    self.showAnswerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.showAnswerButton setTitle:@"Show Answer" forState:UIControlStateNormal];
    self.showAnswerButton.backgroundColor = [UIColor systemGray5Color];
    [self.showAnswerButton addTarget:self action:@selector(showAnswer:) forControlEvents:UIControlEventTouchUpInside];
    
    self.questionField.translatesAutoresizingMaskIntoConstraints = NO;
    self.showQuestionButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.answerField.translatesAutoresizingMaskIntoConstraints = NO;
    self.showAnswerButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.questionField];
    [self.view addSubview:self.showQuestionButton];
    [self.view addSubview:self.answerField];
    [self.view addSubview:self.showAnswerButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.questionField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.questionField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [self.questionField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        
        [self.showQuestionButton.topAnchor constraintEqualToAnchor:self.questionField.bottomAnchor constant:20],
        [self.showQuestionButton.leadingAnchor constraintEqualToAnchor:self.questionField.leadingAnchor],
        [self.showQuestionButton.trailingAnchor constraintEqualToAnchor:self.questionField.trailingAnchor],
        
        [self.answerField.topAnchor constraintEqualToAnchor:self.showQuestionButton.bottomAnchor constant:250],
        [self.answerField.leadingAnchor constraintEqualToAnchor:self.questionField.leadingAnchor],
        [self.answerField.trailingAnchor constraintEqualToAnchor:self.questionField.trailingAnchor],
        
        [self.showAnswerButton.topAnchor constraintEqualToAnchor:self.answerField.bottomAnchor constant:20],
        [self.showAnswerButton.leadingAnchor constraintEqualToAnchor:self.questionField.leadingAnchor],
        [self.showAnswerButton.trailingAnchor constraintEqualToAnchor:self.questionField.trailingAnchor],
    ]];
}

#pragma mark - Actions

- (void)showQuestion:(id)sender
{
    NSLog(@"showQuestion tapped.");
}

- (void)showAnswer:(id)sender
{
    NSLog(@"showAnswer tapped.");
}

@end
