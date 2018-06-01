//
//  NSError+Category.m
//
//  Created by Jun Zhou on 2017/12/14.
//  Copyright © 2017年 Jun Zhou. All rights reserved.
//

#import "NSError+Category.h"

@implementation NSError (Category)

@end

@implementation NSError (ACErrorCode)

/// 平台error code消息
- (NSString *)errorCodeMassage {
    NSString *errorMsg = @"请求失败";
    switch (self.code) {
            
        ///////// SDK端相关常用错误码(1000 - 3000)
        case 1984: errorMsg = @"CRC校验错误"; break;
        case 1985: errorMsg = @"需要先调用connect接口"; break;
        case 1986: errorMsg = @"手机没有WiFi连接"; break;
        case 1987: errorMsg = @"手机无法连接外网"; break;
        case 1988: errorMsg = @"局域网无法搜索到错误"; break;
        case 1989: errorMsg = @"解密出错"; break;
        case 1990: errorMsg = @"无法匹配设备"; break;
        case 1991: errorMsg = @"无效的参数"; break;
        case 1992: errorMsg = @"需要先调用登录接口"; break;
        case 1993: errorMsg = @"请求超时"; break;
        case 1995: errorMsg = @"json序列化出错"; break;
        case 1997: errorMsg = @"返回无效的ACMsg格式"; break;
        case 1998: errorMsg = @"网络出错"; break;
        case 1999: errorMsg = @"内部错误"; break;
            
        ///////// 云端相关常用错误码(3000 - 3500)
        case 3000: errorMsg = @"系统内部错误"; break;
        case 3001: errorMsg = @"请求HEADER错误"; break;
        case 3002: errorMsg = @"请求参数不合法"; break;
        case 3003: errorMsg = @"不支持的请求"; break;
        case 3004: errorMsg = @"不允许的请求"; break;
        case 3005: errorMsg = @"请求没有权限"; break;
        case 3006: errorMsg = @"请求URI错误"; break;
        case 3007: errorMsg = @"请求主域不存在"; break;
        case 3008: errorMsg = @"请求子域不存在"; break;
        case 3009: errorMsg = @"请求服务不存在"; break;
        case 3010: errorMsg = @"请求方法不存在"; break;
        case 3011: errorMsg = @"服务暂不可用"; break;
        case 3012: errorMsg = @"请求超时"; break;
        case 3013: errorMsg = @"网络异常"; break;
        case 3014: errorMsg = @"签名已失效"; break;
        case 3015: errorMsg = @"签名错误"; break;
        case 3016: errorMsg = @"接口没有实现"; break;
        case 3017: errorMsg = @"http error"; break;
        case 3018: errorMsg = @"服务错误"; break;
            
        ///////// 帐号管理相关错误码(3501 - 3600)
        case 3501: errorMsg = @"帐号不存在"; break;
        case 3502: errorMsg = @"帐号已存在"; break;
        case 3503: errorMsg = @"帐号不合法"; break;
        case 3504: errorMsg = @"密码错误"; break;
        case 3505: errorMsg = @"验证码错误"; break;
        case 3506: errorMsg = @"验证码已失效"; break;
        case 3507: errorMsg = @"邮箱不合法"; break;
        case 3508: errorMsg = @"手机不合法"; break;
        case 3509: errorMsg = @"帐号状态异常"; break;
        case 3510: errorMsg = @"账号已经绑定"; break;
        case 3511: errorMsg = @"安全认证失败"; break;
        case 3512: errorMsg = @"帐号扩展信息错误"; break;
        case 3514: errorMsg = @"refresh token错误"; break;
        case 3515: errorMsg = @"access token已经过期"; break;
        case 3516: errorMsg = @"refresh token已经过期，需要用户重新登录"; break;
        case 3517: errorMsg = @"用户自定义扩展字段已经存在"; break;
        case 3518: errorMsg = @"用户自定义扩展字段不存在"; break;
        case 3519: errorMsg = @"账号配额使用超出限制"; break;
        case 3520: errorMsg = @"不允许使用保留字段"; break;
            
        ///////// 设备分组管理相关错误码(3601 - 3800)
        case 3601: errorMsg = @"分组不存在"; break;
        case 3602: errorMsg = @"分组已存在"; break;
        case 3603: errorMsg = @"分组状态异常"; break;
        case 3604: errorMsg = @"成员不存在"; break;
        case 3605: errorMsg = @"成员已存在"; break;
        case 3606: errorMsg = @"成员状态异常"; break;
        
        ///////// 设备相关错误码(3801-3900)
        case 3801: errorMsg = @"设备消息码非法"; break;
        case 3802: errorMsg = @"设备不存在"; break;
        case 3803: errorMsg = @"设备已存在"; break;
        case 3804: errorMsg = @"消息不合法"; break;
        case 3805: errorMsg = @"绑定码已失效"; break;
        case 3806: errorMsg = @"绑定码错误"; break;
        case 3807: errorMsg = @"设备不在线"; break;
        case 3808: errorMsg = @"主设备不存在"; break;
        case 3809: errorMsg = @"设备为主机"; break;
        case 3810: errorMsg = @"消息为备机"; break;
        case 3811: errorMsg = @"设备已绑定"; break;
        case 3812: errorMsg = @"设备未绑定"; break;
        case 3813: errorMsg = @"设备状态异常"; break;
        case 3814: errorMsg = @"设备响应超时"; break;
        case 3815: errorMsg = @"分享码不存在"; break;
        case 3816: errorMsg = @"分享码不合法"; break;
        case 3817: errorMsg = @"分享码已过期"; break;
        case 3818: errorMsg = @"绑定设备超时"; break;
        case 3819: errorMsg = @"不存在的管理员"; break;
        case 3820: errorMsg = @"网关不匹配"; break;
        case 3821: errorMsg = @"管理员不匹配"; break;
        case 3822: errorMsg = @"设备未激活"; break;
        case 3823: errorMsg = @"设备忙"; break;
        case 3824: errorMsg = @"MCU响应错误/MCU响应超时"; break;
        case 3826: errorMsg = @"设备的子域不匹配"; break;
        case 3858: errorMsg = @"设备未授权"; break;
            
        ///////// 存储服务相关错误码(3901 - 4000)
        case 3901: errorMsg = @"文件不存在"; break;
        case 3902: errorMsg = @"文件已存在"; break;
        case 3903: errorMsg = @"文件状态异常"; break;
        case 3904: errorMsg = @"文件校验失败"; break;
        case 3905: errorMsg = @"文件内容异常"; break;
        case 3920: errorMsg = @"数据集不存在"; break;
        case 3921: errorMsg = @"数据集已存在"; break;
        case 3922: errorMsg = @"数据存在错误"; break;
        case 3923: errorMsg = @"数据不存在"; break;
        case 3924: errorMsg = @"数据已存在"; break;
        case 3925: errorMsg = @"错误的数据"; break;
        case 3926: errorMsg = @"数据扫描到尾部"; break;
        case 3927: errorMsg = @"错误的filter参数"; break;
        case 3928: errorMsg = @"错误的expr参数"; break;
        case 3929: errorMsg = @"列不存在"; break;
        case 3930: errorMsg = @"错误的分区键"; break;
        case 3931: errorMsg = @"错误的索引"; break;
        case 3932: errorMsg = @"错误的主键"; break;
        case 3933: errorMsg = @"错误的列"; break;
        case 3934: errorMsg = @"错误的aggregate参数"; break;
        case 3935: errorMsg = @"错误的groupBy参数"; break;
        case 3936: errorMsg = @"错误的orderBy参数"; break;
        case 3937: errorMsg = @"错误的select参数"; break;
            
        ///////// 推送相关错误码(4001 - 4100)
        case 4001: errorMsg = @"推送标题为空"; break;
        case 4002: errorMsg = @"推送内容为空"; break;
        case 4003: errorMsg = @"iOS推送错误，没有有效的iOS设备"; break;
        case 4004: errorMsg = @"安卓推送错误，没有有效的安卓设备"; break;
        case 4005: errorMsg = @"没有设定白名单"; break;
        case 4006: errorMsg = @"签名错误，请核对 ak/sk"; break;
        case 4007: errorMsg = @"推送信息错误，请检查平台的推送信息"; break;
        case 4008: errorMsg = @"请求友盟服务失败"; break;
        case 4009: errorMsg = @"AppKey不存在，请检查友盟配置"; break;
        case 4010: errorMsg = @"生产证书不存在，请在友盟平台上传证书"; break;
        case 4011: errorMsg = @"开发证书不存在，请在友盟平台上传证书"; break;
        case 4012: errorMsg = @"用户列表为空或是用户不存在"; break;
        case 4050: errorMsg = @"未配置第三方短信运营商信息"; break;
        case 4051: errorMsg = @"短信模板不存在"; break;
        case 4057: errorMsg = @"邮件模板未审核通过"; break;
        case 4058: errorMsg = @"邮件模板不存在"; break;
            
        ///////// OTA相关错误码4101-4200）
        case 4101: errorMsg = @"没有新版本"; break;
        case 4102: errorMsg = @"确认设备升级过期"; break;
        case 4103: errorMsg = @"忽略设备升级过期"; break;
        
        ///////// 定时任务相关错误码(4401-4500)
        case 4401: errorMsg = @"定时任务已经过期"; break;
        case 4402: errorMsg = @"定时任务不存在"; break;
        case 4403: errorMsg = @"定时任务状态已经失效"; break;
        case 4404: errorMsg = @"时区错误"; break;
        case 4405: errorMsg = @"时间点非法"; break;
        case 4406: errorMsg = @"时间周期非法"; break;
        case 4407: errorMsg = @"任务已经存在"; break;
        case 4408: errorMsg = @"任务已经启动"; break;
        case 4409: errorMsg = @"任务已经停止"; break;
        case 4410: errorMsg = @"不是一个云端任务"; break;
        case 4411: errorMsg = @"task组已经存在"; break;
        case 4412: errorMsg = @"task组不存在"; break;
        case 4413: errorMsg = @"非法的定时任务类型"; break;
        case 4414: errorMsg = @"非法的定时任务指令"; break;
        case 4415: errorMsg = @"不支持的定时任务指令"; break;
        case 4416: errorMsg = @"任务owner不一致"; break;
            
        ///////// 意见反馈相关错误码(4501-4550)
        case 4501: errorMsg = @"意见反馈的内容格式不正确"; break;
        case 4502: errorMsg = @"意见反馈内容列不存在"; break;
            
        ///////// 排行榜相关错误码(4551-4600)
        case 4552: errorMsg = @"排行榜没有定义不存在"; break;
            
        ///////// 其他错误码
        case 6007: errorMsg = @"条目不存在"; break;
            
        ///////// default
        default: errorMsg = @"请求失败"; break;
    }
    return errorMsg;
}

@end
