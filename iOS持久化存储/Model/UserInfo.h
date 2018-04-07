//
//  UserInfo.h
//  iOS持久化存储
//
//  Created by 李达志 on 2018/4/7.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * sex;
- (void)save;
+ (UserInfo *)sharedMemory;
@end
