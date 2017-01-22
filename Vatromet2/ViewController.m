//
//  ViewController.m
//  Vatromet2
//
//  Created by Anton Orzes on 22/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "ViewController.h"
#import "Raketa.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGPoint startPoint = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height);
    Raketa *r1 = [[Raketa alloc]initWithPosition:startPoint angle:-M_PI_2 view:self.view];
    [self.view addSubview:r1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
