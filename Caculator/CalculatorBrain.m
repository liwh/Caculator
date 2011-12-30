//
//  CalculatorBrain.m
//  Caculator
//
//  Created by liwh on 11-12-30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property(nonatomic,strong)NSMutableArray *operandStack;
@property(nonatomic,strong)NSString *operationSymbol;
@end
@implementation CalculatorBrain
@synthesize operandStack = _operandStack;
@synthesize operationSymbol = _operationSymbol;
-(NSMutableArray *)operandStack{
    if (_operandStack == nil){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}
-(NSString *)operationSymbol{
    if (_operationSymbol == nil){
        _operationSymbol = [[NSString alloc] init];
    }
    return _operationSymbol;
}
-(void) pushOperand:(double)operand 
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}
-(void) pushOperation:(NSString *)operation
{
    self.operationSymbol = operation;
}
-(double) popOperand {
    NSNumber *operanObject = [self.operandStack lastObject];
    if(operanObject) [self.operandStack removeLastObject];
    return [operanObject doubleValue];
}
- (double)performOperation:(NSString *)operationString
{
    double result = 0;
    //caculate the result2
    NSString *operation = [self operationSymbol];
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }else if([@"*" isEqualToString:operation]){
         result = [self popOperand] * [self popOperand];
    }else if([@"/" isEqualToString:operation]){
        double a = [self popOperand];
        double b = [self popOperand];
        result = b ? b/a : a ;
    }else if([@"-" isEqualToString:operation]){
        double a = [self popOperand];
        double b = [self popOperand];
        result = b ? b - a : a;
    }else{
        result = [self popOperand];
    }
    if([operationString isEqualToString:@"="] ){
        self.operandStack = nil;
        self.operationSymbol = nil;
        return result;
    }else if([operationString isEqualToString:@"C"]){
        self.operandStack = nil;
        self.operationSymbol = nil;
        return 0;
    }
    [self pushOperand:result];
    [self pushOperation:operationString];
    return result;
}
@end
