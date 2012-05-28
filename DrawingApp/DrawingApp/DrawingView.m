//
//  DrawingView.m
//  DrawingApp
//
//  Created by Alexander Ikonomidis on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DrawingView.h"
#import "Square.h"

@implementation DrawingView

@synthesize square;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        square = [[Square alloc] initWithPos:10.0 yPos:10];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //CGContextSetLineWidth(context, 5.0);
    //CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    //CGRect rectangle = CGRectMake(10,70,200,80);
    //CGContextAddRect(context, rectangle);
    //CGContextStrokePath(context);
    [square draw:context];
}

@end
