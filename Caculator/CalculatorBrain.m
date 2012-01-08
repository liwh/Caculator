//
//  CalculatorBrain.m
//  Caculator
//
//  Created by liwh on 11-12-30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
@implementation CalculatorBrain
@synthesize result = _result;
@synthesize operation = _operation;
@synthesize oldResult = _oldResult;
@synthesize memory = _memory;

-(void)performWaitingOperation
{
    if ([self.operation isEqualToString:@"+"]){
        self.result = self.oldResult + self.result;
    }else if([@"X" isEqualToString:self.operation]){
        self.result = self.oldResult * self.result;
    }else if([@"/" isEqualToString:self.operation]){
        self.result = self.oldResult / self.result;
    }else if([@"-" isEqualToString:self.operation]){
        self.result = self.oldResult - self.result;
    }
}
- (double)performOperation:(NSString *)operationString
{
    //caculate the result
    if([operationString isEqualToString:@"AC"]){
        self.oldResult = 0;
        self.operation = nil;
        return 0;
    }else if([operationString isEqualToString:@"MC"] ){
        self.memory = 0;
    }else if([operationString isEqualToString:@"M+"] ){
        self.memory += self.result;
    }else if([operationString isEqualToString:@"M-"] ){
        self.memory -= self.result;
    }else if([operationString isEqualToString:@"MR"] ){
        self.result = self.memory;
    }else if([operationString isEqualToString:@"+/-"] ){
        self.oldResult = - self.result;
    }else{
        [self performWaitingOperation];
        self.operation = operationString;
        self.oldResult = self.result;
    }
    return self.result;
}

@end
