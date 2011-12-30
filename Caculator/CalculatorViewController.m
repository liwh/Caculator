//
//  CalculatorViewController.m
//  Caculator
//
//  Created by liwh on 11-12-30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
@interface CalculatorViewController()
@property (nonatomic) BOOL isTheMiddleOfANumber;
@property (nonatomic,strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController
@synthesize display = _display;
@synthesize isTheMiddleOfANumber = _isTheMiddleOfANumber;
@synthesize brain = _brain;

- (IBAction)digitNumber:(UIButton *)sender {
    NSString* digit = [sender currentTitle];
    if (self.isTheMiddleOfANumber){
    self.display.text = [[self.display text]stringByAppendingString:digit];
    } else if([self.display.text isEqualToString:@"0"] && [digit isEqualToString:@"0"]){
         self.isTheMiddleOfANumber = NO;
    }else{
        self.display.text = digit;
        self.isTheMiddleOfANumber = YES;
    }
}
- (void)enterPressed{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.isTheMiddleOfANumber = NO;
}
-(CalculatorBrain *) brain {
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}
- (IBAction)operate:(UIButton *)sender {
    if (self.isTheMiddleOfANumber) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
