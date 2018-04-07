//
//  ViewController.m
//  iOS持久化存储
//
//  Created by 李达志 on 2018/4/7.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "ViewController.h"
#import "UserInfo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UserInfo* user=[[UserInfo alloc]init];
    user.name=@"李大致";
    user.sex=@"男";
    [user save];
    UserInfo*user2=[UserInfo sharedMemory];
    NSLog(@"%@",user2.name);

}





@end
