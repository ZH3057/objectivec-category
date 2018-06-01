//
//  NSString+Category.h
//  
//
//  Created by Jun on 2017/7/18.
//  Copyright © 2017年 ZHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Category)

@end

@interface NSString (Unicode)
- (NSString *)unicodeString;
@end


@interface NSString (Tool)

+ (CGFloat)getHeightWithString:(NSString *)string maxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style;

- (CGFloat)getHeightWithMaxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style;

+ (CGSize)getSizeWithString:(NSString *)string maxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style;

- (CGSize)getSizeWithMaxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style;

+ (NSString *)convertTobinaryString:(NSString *)value;

- (NSString *)binaryString;

- (NSString *)binaryStringWithByteLength:(int)length showDivideFlag:(BOOL)showDivideFlag;

+ (NSString *)convertTobinaryString:(NSString *)value ByteLength:(int)length showDivideFlag:(BOOL)showDivideFlag;

+ (NSString *)intToBinary:(NSInteger)intValue showDivideFlag:(BOOL)showDivideFlag;

+ (NSString *)intToBinary:(NSInteger)intValue byteLength:(int)length showDivideFlag:(BOOL)showDivideFlag;

+ (NSString *)convertHexStrToString:(NSString *)hexString;

+ (NSString *)convertStringToHexString:(NSString *)string;

+ (NSData *)hexToBytes:(NSString *)string;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

- (NSDictionary *)jsonStringToDictionary;

+ (BOOL)isBlankString:(NSString *)string;

- (BOOL)isBlankString;

@end
