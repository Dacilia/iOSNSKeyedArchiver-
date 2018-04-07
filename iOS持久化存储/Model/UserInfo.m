
    //
    //  UserInfo.m
    //  iOS持久化存储
    //
    //  Created by 李达志 on 2018/4/7.
    //  Copyright © 2018年 LDZ. All rights reserved.
    //

#import "UserInfo.h"

@implementation UserInfo
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_sex forKey:@"_sex"];
    [aCoder encodeObject:_name forKey:@"_name"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        _name=[aDecoder decodeObjectForKey:@"_name"];
        _sex=[aDecoder decodeObjectForKey:@"_sex"];
    }
    return self;
}
+ (NSString *)path

{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    NSString *documentDir = [paths objectAtIndex:0];

    NSString *dstPath = [documentDir stringByAppendingPathComponent:@"user.data"];

    return dstPath;

}
- (void)save

{

    [NSKeyedArchiver archiveRootObject:self toFile:[UserInfo path]];

}
+ (UserInfo *)sharedMemory

{

    static dispatch_once_t onceToken;
     static UserInfo *instance;
    dispatch_once(&onceToken, ^{

        if ([[NSFileManager defaultManager] fileExistsAtPath:[UserInfo path]]) {
            instance = [NSKeyedUnarchiver unarchiveObjectWithData:

                        [NSData dataWithContentsOfFile:[UserInfo path]]];


        }else{

            instance = [[UserInfo alloc] init];

        }

    });

    return instance;

}
@end
