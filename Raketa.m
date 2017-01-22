//
//  Raketa.m
//  Vatromet2
//
//  Created by Anton Orzes on 22/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "Raketa.h"
#import "Eksplozija.h"

@interface Raketa()
{
    CGPoint startPosition;
    CGPoint d; //promjena po x,y
    float maxDistance;
    NSTimer *t;
    ViewController *mainView;
}
@end

@implementation Raketa
- (id)initWithPosition:(CGPoint)position angle:(float)k view:(ViewController *)mv {
    self = [super init];
    const float velocity = 5.0;
    maxDistance = 150;
    startPosition = position;
    mainView = mv;
    if (self) {
        d.x = cos(k) * velocity;
        d.y = sin(k) * velocity;
        [self makeRocket:position];
        t = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(moveRocket)
                                           userInfo:nil
                                            repeats:YES];
    }
    return self;
}

- (void)moveRocket {
    CGPoint position = self.center;
    position.x += d.x;
    position.y += d.y;
    self.center = position;
    float distance = hypotf(position.x-startPosition.x,position.y-startPosition.y);
    if(distance>maxDistance) {
        if(mainView.maxExplosion-- >0){
            [Eksplozija initWithView:mainView position:position];
        }
        [t invalidate];
        t = nil;
        [self removeFromSuperview];
    }

}

- (void)makeRocket:(CGPoint)position {
    self.frame = CGRectMake(position.x, position.y, 5, 5);
    self.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

@end
