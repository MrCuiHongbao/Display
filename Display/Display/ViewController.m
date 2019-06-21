//
//  ViewController.m
//  Display
//
//  Created by hongbao.cui on 2018/5/30.
//  Copyright © 2018年 hongbao.cui. All rights reserved.
//

#import "ViewController.h"
static NSString *indentifier = @"myIdentifier";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *array ;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    if ([self initLoadDynamic:@"DisplayB.framework"]) {
        NSLog(@"DisplayB.framework  load success");
    }
    if ([self initLoadDynamic:@"DisplayA.framework"]) {
        NSLog(@"DisplayA.framework  load success");
    };
    Class class = NSClassFromString(@"HBMyTest");
    [[[class alloc] init] performSelector:@selector(method) withObject:nil];
}
- (BOOL)initLoadDynamic:(NSString *)fileName{
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Frameworks"];
    path = [NSString stringWithFormat:@"%@/%@",path,fileName];
    NSError *err = nil;
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    if ([bundle loadAndReturnError:&err])
    {
        NSLog(@"bundle load framework success.");
        return YES;
    }
    else
    {
        NSLog(@"bundle load framework err:%@", err);
        return NO;
    }
}
- (void)initTableView {
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [self.view addSubview:tableView];
//
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:indentifier];
    self.array = [NSMutableArray arrayWithObjects:@"webPViewController",@"AlgorithmViewController", nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@",(long)indexPath.row+1,[self.array objectAtIndex:indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = [self.array objectAtIndex:indexPath.row];
    Class  class  = NSClassFromString(className);
    [self.navigationController pushViewController:[[class alloc] init] animated:YES];
}
@end
