//
//  webPViewController.m
//  Display
//
//  Created by hongbao.cui on 2019/6/13.
//  Copyright © 2019年 hongbao.cui. All rights reserved.
//

#import "webPViewController.h"
#import <UIImage+WebP.h>
#import "Masonry.h"
@interface webPViewController ()

@end

@implementation webPViewController
+(void)load {
    NSLog(@"webPViewController--------------->load");
}
+(void)initialize {
    NSLog(@"webPViewController--------------->initialize");
}
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"webPViewController--------------->init:%@",NSStringFromClass([self class]));
        NSLog(@"webPViewController-------super-------->init:%@",NSStringFromClass([super superclass]));
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];
}
- (void)initViews {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"example_small_webP" ofType:@"webp"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage sd_imageWithWebPData:imageData];
    UIImageView *webP = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:webP];
    [webP mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset = 20.0;
        make.right.equalTo(self.view).offset = -20.0;
        make.centerX.equalTo(self.view);
    }];
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
