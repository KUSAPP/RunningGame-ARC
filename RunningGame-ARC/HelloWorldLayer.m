//
//  HelloWorldLayer.m
//  RunningGame
//
//  Created by Chanon Khamronyutha on 1/12/13.
//  Copyright Chanon Khamronyutha 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize bear = _bear;
@synthesize walkAction = _walkAction;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//Scroll
-(void) scroll:(ccTime)dt {
    cave1.position = ccp(cave1.position.x-5,0);
    cave2.position = ccp(cave2.position.x-5,0);
    
    if(cave1.position.x < - [cave1 boundingBox].size.width) {
        cave1.position = ccp(cave2.position.x + [cave2 boundingBox].size.width - 1,0);
    }
    else if(cave2.position.x < -[cave2 boundingBox].size.width) {
        cave2.position = ccp(cave1.position.x + [cave1 boundingBox].size.width - 1,0);
    }
    
}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"AnimBear.plist"];
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"AnimBear.png"];
        
        [self addChild:spriteSheet];
        
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        for(int i = 1 ; i <= 8 ; i++) {
            [walkAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"bear%d.png",i]]];
        }
        
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:0.07f];
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        self.bear = [CCSprite spriteWithSpriteFrameName:@"bear1.png"];
        _bear.position = ccp(winSize.width/3, winSize.height*2/5);
        _bear.flipX = YES;
        self.walkAction = [CCRepeatForever actionWithAction:
                           [CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
        
        [_bear runAction:_walkAction];
        [spriteSheet addChild:_bear];
        
        
        
        
        cave1 = [CCSprite spriteWithFile:@"cave floor.png"];
        cave1.anchorPoint = ccp(0,0);
        cave1.position = ccp(0,0);
        [self addChild:cave1];
        
        cave2 = [CCSprite spriteWithFile:@"cave floor.png"];
        cave2.anchorPoint = ccp(0,0);
        cave2.position = ccp([cave1 boundingBox].size.width-1,0);
        [self addChild:cave2];
        
        [self schedule:@selector(scroll:) interval:0.001];
        
    }
	return self;
}



#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
