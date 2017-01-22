//
//  Raketa.m
//  Vatromet2
//
//  Created by Anton Orzes on 22/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "Raketa.h"
#import "Eksplozija.h"

extern int maxExplosion;

@interface Raketa()
{
    CGPoint startPosition;
    CGPoint d; //promjena po x,y
    float maxDistance;
    NSTimer *t;
    UIView *mainView;
}
@end

@implementation Raketa
- (id)initWithPosition:(CGPoint)position angle:(float)k view:(UIView *)mv {
    self = [super init];
    const float velocity = 5.0;
    maxDistance = 150;
    startPosition = position;
    mainView = mv;
    if (self) {
        d.x = cos(k) * velocity;
        d.y = sin(k) * velocity;
        [self makeRocket:position];
        t = [NSTimer scheduledTimerWithTimeInterval:0.05
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
    [self trag:position];
    float distance = hypotf(position.x-startPosition.x,position.y-startPosition.y);
    if(distance>maxDistance) {
        if(maxExplosion-- >0){
            [Eksplozija initWithView:mainView position:position];
        }
        [t invalidate];
        t = nil;
        [self removeFromSuperview];
    }

}

- (void)trag:(CGPoint)position {
    UIView *redDot = [[UIView alloc]initWithFrame:CGRectMake(position.x, position.y, 5, 5)];
    redDot.center = position;
    redDot.backgroundColor = [UIColor redColor];
    redDot.layer.cornerRadius = 5;
    redDot.layer.masksToBounds = YES;
    [mainView addSubview:redDot];
    [UIView animateWithDuration:0.1f animations:^{
        [redDot setAlpha:1.0f];
        } completion:^(BOOL finished) {
        //fade out
            [UIView animateWithDuration:1.0f animations:^{
                [redDot setAlpha:0.0f];
                } completion:^(BOOL endeded) {
                    if(endeded) [redDot removeFromSuperview];
                }];
    }];
    

}

- (void)makeRocket:(CGPoint)position {
    self.frame = CGRectMake(position.x, position.y, 5, 5);
    self.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

@end
