//
//  Square.m
//  DrawingApp
//
//  Created by Tiernan Garsys on 5/27/12.
//  Copyright (c) 2012 University of Pennsylvania. All rights reserved.
//

#import "Square.h"

@implementation Square

@synthesize xPos;
@synthesize yPos;

-(Square*)initWithPos: (int) x yPos: (int) y {
    
    self = [super init];
    
    xPos = x;
    yPos = y;
    
    return self;
}

-(void)setPos: (int) x newYPos: (int) y {
    NSLog(@"SET DAT POSITION");
    xPos = x;
    yPos = y;
    
    NSLog(@"xPos: %d", xPos);
}

-(void)draw: (CGContextRef) context {
    NSLog(@"drawContext");
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGRect rectangle = CGRectMake(self.xPos,self.yPos,80,80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, rectangle);
    
}

@end
