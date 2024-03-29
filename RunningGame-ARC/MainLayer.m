//
//  MainLayer.m
//  RunningGame-ARC
//
//  Created by Pawis Chairoj on 1/12/56 BE.
//  Copyright 2556 KUSAPP. All rights reserved.
//

#import "MainLayer.h"
#import "Player.h"
#import "Background.h"

@implementation MainLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	Player *player = [Player node];
    Background *bg = [Background node];
	
    
	// add layer as a child to scene
	[scene addChild: player];
    [scene addChild: bg];
	
	// return the scene
	return scene;
}

-(void)swipeLeft:(UIGestureRecognizer*)recognizer
{
    NSLog(@"Recognised");
}

-(void) setupGestureRecognizers
{
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [swipeLeft setNumberOfTouchesRequired:1];
    
    [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:swipeLeft];
    
}

@end
