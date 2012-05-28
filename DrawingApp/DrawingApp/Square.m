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

-(void)draw: (CGContextRef) context {
    NSLog(@"drawContext");
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(60,170,200,80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillRect(context, rectangle);
    
}

@end
