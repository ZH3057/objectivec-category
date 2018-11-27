//
//  NSDate+Category.h
//  Category
//
//  Created by Jun Zhou on 2018/11/27.
//  Copyright © 2018 Jun Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define D_MINUTE    60
#define D_HOUR        3600
#define D_DAY        86400
#define D_WEEK        604800
#define D_YEAR        31556926

@interface NSDate (Category)

+ (NSDate *)dateTomorrow;
+ (NSDate *)dateYesterday;
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)dMinutes;




- (BOOL)isEqualToDateIgnoringTime: (NSDate *) aDate;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;
- (BOOL)isSameWeekAsDate: (NSDate *) aDate;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;
- (BOOL)isSameMonthAsDate: (NSDate *) aDate;
- (BOOL)isThisMonth;
- (BOOL)isSameYearAsDate: (NSDate *) aDate;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;
- (BOOL)isEarlierThanDate: (NSDate *) aDate;
- (BOOL)isLaterThanDate: (NSDate *) aDate;
- (BOOL)isInFuture;
- (BOOL)isInPast;

- (BOOL)isBefore:(NSDate *)date;
- (BOOL)isAfter:(NSDate *)date;
- (BOOL)isBeforeOrEqual:(NSDate *)date;
- (BOOL)isAfterOrEqual:(NSDate *)date;


- (NSInteger)minutesAfterDate:(NSDate *)aDate;
- (NSInteger)minutesBeforeDate:(NSDate *)aDate;
- (NSInteger)hoursAfterDate:(NSDate *)aDate;
- (NSInteger)hoursBeforeDate:(NSDate *)aDate;
- (NSInteger)daysAfterDate:(NSDate *)aDate;
- (NSInteger)daysBeforeDate:(NSDate *)aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;



@property (nonatomic, assign, readonly) NSInteger nearestHour;
@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger seconds;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger week;
@property (nonatomic, assign, readonly) NSInteger weekday;
@property (nonatomic, assign, readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (nonatomic, assign, readonly) NSInteger year;

@end

NS_ASSUME_NONNULL_END
