//
//  Player.m
//  RunningGame-ARC
//
//  Created by Pawis Chairoj on 1/12/56 BE.
//  Copyright 2556 KUSAPP. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize moveAction = _moveAction;
@synthesize player = _player;

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"blitting.plist"];
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"blitting.png"];
        self.isTouchEnabled = YES;
        [self addChild:spriteSheet];
        
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        for(int i = 1 ; i <= 8 ; i++) {
            [walkAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"%d.png",i]]];
        }
        
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:0.07f];
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        self.player = [CCSprite spriteWithSpriteFrameName:@"1.png"];
        _player.position = ccp(winSize.width/4, winSize.height*1.3/5);
        self.moveAction = [CCRepeatForever actionWithAction:
                           [CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
        
        [_player runAction:_moveAction];
        [spriteSheet addChild:_player];
        
    }
	return self;
}



@end
