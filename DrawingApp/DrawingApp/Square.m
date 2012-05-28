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
@synthesize xVel;
@synthesize yVel;

-(Square*) initWithPos: (float) x yPos: (float) y {
    
    self = [super init];
    
    xPos = x;
    yPos = y;
    xVel = 1;
    yVel = 1;
    
    return self;
}

-(void) setPos: (float) x newYPos: (float) y {
    NSLog(@"SET DAT POSITION");
    xPos = x;
    yPos = y;
    
    NSLog(@"xPos: %f", xPos);
}

-(void) draw: (CGContextRef) context {
    NSLog(@"drawContext");
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGRect rectangle = CGRectMake(self.xPos,self.yPos,80,80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, rectangle);
    
}

-(void) move {
    xPos += xVel;
    yPos += yVel;
}

@end
