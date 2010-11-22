#import <Foundation/Foundation.h>

@interface Expect : NSObject {
}

+ (void)int:(int)expected toEqual:(int)actual;
+ (void)object:(NSObject *)expected toEqual:(NSObject *)actual;
+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason;
+ (void)blockToNotThrowException:(void (^)())block;

@end
