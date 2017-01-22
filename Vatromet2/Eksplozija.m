//
//  Eksplozija.m
//  Vatromet2
//
//  Created by Anton Orzes on 22/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "Eksplozija.h"

@implementation Eksplozija

+(void)initWithView:(ViewController *)mainView position:(CGPoint)position {
   
    for (int i=0; i<12; i++) {
        float kut = M_PI/6 * (float)i;
        Raketa *r1 = [[Raketa alloc]initWithPosition:position angle:kut view:mainView];
        [mainView.view addSubview:r1];
    }
    
}
@end
