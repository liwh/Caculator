//
//  CalculatorBrain.h
//  Caculator
//
//  Created by liwh on 11-12-30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void) pushOperand:(double)operand;
-(double) performOperation:(NSString *) operation;
@end
