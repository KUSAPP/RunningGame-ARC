//
//  HelloWorldLayer.h
//  RunningGame
//
//  Created by Chanon Khamronyutha on 1/12/13.
//  Copyright Chanon Khamronyutha 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCSprite *_bear;
    CCAction *_walkAction;
    
    CCSprite *cave1;
    CCSprite *cave2;
}

@property (nonatomic,retain) CCSprite *bear;
@property (nonatomic,retain) CCAction *walkAction;

-(void) scroll:(ccTime)dt;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
