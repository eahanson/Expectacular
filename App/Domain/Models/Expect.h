#import <Foundation/Foundation.h>

@interface Expect : NSObject {
}

+ (void)bool:(BOOL)expected toEqual:(BOOL)actual;
+ (void)bool:(BOOL)expected toNotEqual:(BOOL)actual;

+ (void)int:(int)expected toEqual:(int)actual;
+ (void)int:(int)expected toNotEqual:(int)actual;
+ (void)int:(int)expected toBeLessThan:(int)actual;
+ (void)int:(int)expected toBeGreaterThan:(int)actual;

+ (void)object:(NSObject *)expected toEqual:(NSObject *)actual;

+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason;
+ (void)blockToNotThrowException:(void (^)())block;

@end
