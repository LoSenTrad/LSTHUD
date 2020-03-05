//
//  LSTViewController.m
//  LSTHUD
//
//  Created by 490790096@qq.com on 08/10/2019.
//  Copyright (c) 2019 490790096@qq.com. All rights reserved.
//

#import "LSTViewController.h"
#import <LSTHUD.h>

@interface LSTViewController ()

@end

@implementation LSTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = UIColor.whiteColor;
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [LSTHUD showLoadingMsgInWindow:@"请稍后"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
