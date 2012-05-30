//
//  Square.h
//  DrawingApp
//
//  Created by Tiernan Garsys on 5/27/12.
//  Copyright (c) 2012 Gariko Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Square : NSObject

@property float xPos;
@property float yPos;
@property float xVel;
@property float yVel;

-(Square*)initWithPos: (float) x yPos: (float) y;

// Basic physics simulation methods, or something of that nature?
-(void)move;
-(void)accelerate;
-(BOOL)doCollision: (CGRect) bounds;

-(void)draw: (CGContextRef) context;
-(void)setPos: (CGPoint) point;
-(void)setCenter: (CGPoint) point;
-(void)translate: (CGPoint) translation withDamper: (float) damper;
-(void)setVel: (CGPoint) velocity;
-(void)setVel: (CGPoint) velocity withDamper: (float) damper;
-(void)resetVel;


@end
