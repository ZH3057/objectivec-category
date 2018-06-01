//
//  NSString+Category.m
//  
//
//  Created by Jun on 2017/7/18.
//  Copyright © 2017年 ZHJ. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

@end

@implementation NSString (Unicode)
- (NSString *)unicodeString{
    
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSPropertyListFormat format = NSPropertyListOpenStepFormat;
    
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:&format error:nil];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
    
    
}
@end


@implementation NSString (Tool)

- (CGFloat)getHeightWithMaxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style {
    if (self.length == 0) {
        return 0;
    }
    
    if (maxWidth <= 0) {
        maxWidth = [UIScreen mainScreen].bounds.size.width;
    }
    if (fontSize <= 0) {
        fontSize = 12;
    }
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName];
    if (style) {
        [dic setObject:style forKey:NSParagraphStyleAttributeName];
    }
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth,MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    return size.height;
}

+ (CGFloat)getHeightWithString:(NSString *)string maxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style {
    
    return [string getHeightWithMaxWidth:maxWidth fontSize:fontSize style:style];
}

+ (CGSize)getSizeWithString:(NSString *)string maxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style {
    return [string getSizeWithMaxWidth:maxWidth fontSize:fontSize style:style];
}

- (CGSize)getSizeWithMaxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize style:(NSMutableParagraphStyle *)style {
    if (self.length == 0) {
        return CGSizeZero;
    }
    
    if (maxWidth <= 0) {
        maxWidth = [UIScreen mainScreen].bounds.size.width;
    }
    if (fontSize <= 0) {
        fontSize = 12;
    }
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName];
    if (style) {
        [dic setObject:style forKey:NSParagraphStyleAttributeName];
    }
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth,MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    return size;
}


- (NSString *)binaryString {
    
    NSMutableString *string = [NSMutableString string];
    NSInteger interValue = [self integerValue];
    
    while (interValue) {
        [string insertString:(interValue & 1) ? @"1": @"0" atIndex:0];
        interValue = interValue >> 1;
    }
    return [string copy];
}


+ (NSString *)convertTobinaryString:(NSString *)value {
    
    return [value binaryString];
}


- (NSString *)binaryStringWithByteLength:(int)length showDivideFlag:(BOOL)showDivideFlag {
    
    NSInteger intValue = [self integerValue];
    int byteBlock = 8,    // 每个字节8位
    totalBits = length * byteBlock, // 总位数
    binaryDigit = 1;  // 当前掩（masked）位
    NSMutableString *binaryStr = [[NSMutableString alloc] init];   // 二进制字串
    
    do {
        
        [binaryStr insertString:((intValue & binaryDigit) ? @"1" : @"0" ) atIndex:0];
        
        if (--totalBits && !(totalBits % byteBlock) && showDivideFlag) [binaryStr insertString:@"|" atIndex:0];
        
        binaryDigit <<= 1;
        
    } while (totalBits);
    
    return [binaryStr copy];
}

+ (NSString *)convertTobinaryString:(NSString *)value ByteLength:(int)length showDivideFlag:(BOOL)showDivideFlag {
    
    return [value binaryStringWithByteLength:length showDivideFlag:showDivideFlag];

}


+ (NSString *)intToBinary:(NSInteger)intValue showDivideFlag:(BOOL)showDivideFlag {
    int byteBlock = 8,    // 每个字节8位
    totalBits = sizeof(NSInteger) * byteBlock, // 总位数（不写死，可以适应变化）
    binaryDigit = 1;  // 当前掩（masked）位
    NSMutableString *binaryStr = [[NSMutableString alloc] init];   // 二进制字串
    
    do {
       
        [binaryStr insertString:((intValue & binaryDigit) ? @"1" : @"0" ) atIndex:0];
        
        if (--totalBits && !(totalBits % byteBlock) && showDivideFlag) [binaryStr insertString:@"|" atIndex:0];
        
        binaryDigit <<= 1;
        
    } while (totalBits);
    
    return [binaryStr copy];
}

+ (NSString *)intToBinary:(NSInteger)intValue byteLength:(int)length showDivideFlag:(BOOL)showDivideFlag {
    int byteBlock = 8,    // 每个字节8位
    totalBits = length * byteBlock, // 总位数（不写死，可以适应变化）
    binaryDigit = 1;  // 当前掩（masked）位
    NSMutableString *binaryStr = [[NSMutableString alloc] init];   // 二进制字串
    
    do {
        
        [binaryStr insertString:((intValue & binaryDigit) ? @"1" : @"0" ) atIndex:0];
        
        if (--totalBits && !(totalBits % byteBlock) && showDivideFlag) [binaryStr insertString:@"|" atIndex:0];
        
        binaryDigit <<= 1;
        
    } while (totalBits);
    
    return [binaryStr copy];
}



// 将十六进制的字符串转换成NSString

+ (NSString *)convertHexStrToString:(NSString *)hexString {
    if (!hexString || [hexString length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([hexString length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [hexString length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [hexString substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    NSString *string = [[NSString alloc]initWithData:hexData encoding:NSUTF8StringEncoding];
    return string;
}

//将NSString转换成十六进制的字符串

+ (NSString *)convertStringToHexString:(NSString *)string {
    if (!string || [string length] == 0) {
        return @"";
    }
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableString *hexString = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *temphexString = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([temphexString length] == 2) {
                [hexString appendString:temphexString];
            } else {
                [hexString appendFormat:@"0%@", temphexString];
            }
        }
    }];
    
    return hexString;
}

+ (NSData *)hexToBytes:(NSString *)string {
    
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= string.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [string substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;

}


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) return nil;
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    
    if(error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    
    return dic;
    
}

- (NSDictionary *)jsonStringToDictionary {
    return [NSString dictionaryWithJsonString:self];
}


/** 字符串判空 */
+ (BOOL)isBlankString:(NSString *)string {
    
    if (string == nil ||
        string == NULL ||
        string.length == 0 ||
        [string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:set];
    if (trimmedString.length == 0) {
        return YES;
    }
    return NO;
}

/** 字符串判空 */
- (BOOL)isBlankString {
    return [NSString isBlankString:self];
}

@end
