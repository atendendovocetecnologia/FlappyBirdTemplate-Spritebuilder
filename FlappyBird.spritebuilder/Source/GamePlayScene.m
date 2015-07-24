#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = ((Character*)[CCBReader load:@"Character"]);
    [physicsNode addChild:character];
    timeSinceObstacle = 0.0f;

    [self addObstacle];
}

-(void)update:(CCTime)delta
{
    // put update code here
    // Incrementa o tempo desde o ultimo obstaculo foi adicionado
    timeSinceObstacle += delta; // delta eh aproximadamente 1/60 de um segundo
    
    // checa para ver se 2 segundos se passaram
    if (timeSinceObstacle > 2.0f)
    {
        [self addObstacle];
        
        // reseta o timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

@end
