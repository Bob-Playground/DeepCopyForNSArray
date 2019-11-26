//
//  ViewController.m
//  DeepCopyForNSArray
//
//  Created by HuangLibo on 2019/11/27.
//  Copyright © 2019 HuangLibo. All rights reserved.
//

#import "ViewController.h"
#import "HLBPeople.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self example2];
}

// 或实现 NSCoding 协议，使用 NSKeyedArchiver 和 NSKeyedUnarchiver 来获取一份新的副本。

- (void)example2 {
    HLBPeople *element_1 = [[HLBPeople alloc] initWithName:@"Adam"];
    HLBPeople *element_2 = [[HLBPeople alloc] initWithName:@"Bob"];
    HLBPeople *element_3 = [[HLBPeople alloc] initWithName:@"Carl"];
    NSArray *originalArray = @[element_1, element_2, element_3];
    
    // 1. 直接对 NSArray 调用 copy。
    NSArray *copiedArray_A = [originalArray copy];
    // 2. 通过调用 `-initWithArray:copyItems:` 方法创建新数组，会对数组中的每个元素做 copy操作。
    //   （如果元素为实现 NSCopying 协议，则会 crash。）
    NSArray *copiedArray_B = [[NSArray alloc] initWithArray:originalArray copyItems:YES];
    
    element_1.name = @"name changed!";
    
    NSLog(@"\n copiedArray_A: %@，copiedArray_B: %@", copiedArray_A, copiedArray_B);
}

- (void)example1 {
    NSMutableString *element_1 = [@"element 1." mutableCopy];
    NSMutableString *element_2 = [@"element 2." mutableCopy];
    NSMutableString *element_3 = [@"element 3." mutableCopy];
    NSArray *originalArray = @[element_1, element_2, element_3];
    
    // 1. 直接对 NSArray 调用 copy。
    NSArray *copiedArray_A = [originalArray copy];
    // 2. 通过调用 `-initWithArray:copyItems:` 方法创建新数组，会对数组中的每个元素做 copy操作。
    //   （如果元素为实现 NSCopying 协议，则会 crash。）
    NSArray *copiedArray_B = [[NSArray alloc] initWithArray:originalArray copyItems:YES];
    
    [element_1 appendString:@"appended content."];
    
    NSLog(@"\n copiedArray_A: %@，copiedArray_B: %@", copiedArray_A, copiedArray_B);
}


@end
