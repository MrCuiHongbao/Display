//
//  BaseViewController.m
//  Display
//
//  Created by hongbao.cui on 2019/6/19.
//  Copyright © 2019年 hongbao.cui. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
+(void)load {
    NSLog(@"BaseViewController---------------load");
}
+(void)initialize {
    NSLog(@"BaseViewController--------------->initialize");
}
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"BaseViewController--------------->init");
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
