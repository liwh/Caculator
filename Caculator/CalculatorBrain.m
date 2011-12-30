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
@end
@implementation CalculatorBrain
@synthesize operandStack = _operandStack;
-(NSMutableArray *)operandStack{
    if (_operandStack == nil){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}
-(void) pushOperand:(double)operand 
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}
-(double) popOperand {
    NSNumber *operanObject = [self.operandStack lastObject];
    if(operanObject) [self.operandStack removeLastObject];
    return [operanObject doubleValue];
}
- (double)performOperation:(NSString *)operation
{
    double result = 0;
    //caculate the result
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
    }
    [self pushOperand:result];
    return result;
}
@end
