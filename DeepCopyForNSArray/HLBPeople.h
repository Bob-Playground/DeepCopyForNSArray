//
//  HLBPeople.h
//  DeepCopyForNSArray
//
//  Created by HuangLibo on 2019/11/27.
//  Copyright © 2019 HuangLibo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLBPeople : NSObject <NSCopying>

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
