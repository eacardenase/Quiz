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
        self.questions = @[
            @"From what is cognac made?",
            @"What is 7+7?",
            @"What is the capital of Vermont?",
        ];
        self.answers = @[
            @"Grapes",
            @"14",
            @"Montpelier",
        ];
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

- (void)setupViews
{
    self.questionLabel = [UILabel new];
    self.questionLabel.text = @"";
    self.questionLabel.textAlignment = NSTextAlignmentCenter;
    
    self.showQuestionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.showQuestionButton setTitle:@"Show Question" forState:UIControlStateNormal];
    self.showQuestionButton.backgroundColor = [UIColor systemGray5Color];
    [self.showQuestionButton addTarget:self action:@selector(showQuestion:) forControlEvents:UIControlEventTouchUpInside];
    
    self.answerLabel = [UILabel new];
    self.answerLabel.text = @"???";
    self.answerLabel.textAlignment = NSTextAlignmentCenter;
    
    self.showAnswerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.showAnswerButton setTitle:@"Show Answer" forState:UIControlStateNormal];
    self.showAnswerButton.backgroundColor = [UIColor systemGray5Color];
    [self.showAnswerButton addTarget:self action:@selector(showAnswer:) forControlEvents:UIControlEventTouchUpInside];
    
    self.questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.showQuestionButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.answerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.showAnswerButton.translatesAutoresizingMaskIntoConstraints = NO;
    
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
        
        [self.answerLabel.topAnchor constraintEqualToAnchor:self.showQuestionButton.bottomAnchor constant:250],
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
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
}

@end
