//
//  NSError+Category.h
//
//  Created by Jun Zhou on 2017/12/14.
//  Copyright © 2017年 Jun Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Category)

@end


@interface NSError (ACErrorCode)

/** 平台error code消息 */
- (NSString *)errorCodeMassage;

@end
