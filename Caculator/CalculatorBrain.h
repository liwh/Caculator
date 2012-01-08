//
//  CalculatorBrain.h
//  Caculator
//
//  Created by liwh on 11-12-30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
@property(nonatomic,assign)double result;
@property(nonatomic,assign)double memory;
@property(nonatomic,retain)NSString *operation;
@property(nonatomic,assign)double oldResult;
-(double) performOperation:(NSString *) operation;
@end
