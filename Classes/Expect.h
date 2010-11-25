#import <Foundation/Foundation.h>

@interface Expect : NSObject

#pragma mark bool 

+ (void)bool:(BOOL)expected toEqual:(BOOL)actual;

+ (void)bool:(BOOL)expected toNotEqual:(BOOL)actual;

#pragma mark char

+ (void)char:(char)expected toEqual:(char)actual;

+ (void)char:(char)expected toNotEqual:(char)actual;

+ (void)char:(char)expected toBeLessThan:(char)actual;

+ (void)char:(char)expected toBeGreaterThan:(char)actual;

#pragma mark int

+ (void)int:(int)expected toEqual:(int)actual;

+ (void)int:(int)expected toNotEqual:(int)actual;

+ (void)int:(int)expected toBeLessThan:(int)actual;

+ (void)int:(int)expected toBeGreaterThan:(int)actual;

#pragma mark short

+ (void)short:(short)expected toEqual:(short)actual;

+ (void)short:(short)expected toNotEqual:(short)actual;

+ (void)short:(short)expected toBeLessThan:(short)actual;

+ (void)short:(short)expected toBeGreaterThan:(short)actual;

#pragma mark long

+ (void)long:(long)expected toEqual:(long)actual;

+ (void)long:(long)expected toNotEqual:(long)actual;

+ (void)long:(long)expected toBeLessThan:(long)actual;

+ (void)long:(long)expected toBeGreaterThan:(long)actual;

#pragma mark long long

+ (void)longLong:(long long)expected toEqual:(long long)actual;

+ (void)longLong:(long long)expected toNotEqual:(long long)actual;

+ (void)longLong:(long long)expected toBeLessThan:(long long)actual;

+ (void)longLong:(long long)expected toBeGreaterThan:(long long)actual;

#pragma mark unsigned char

+ (void)unsignedChar:(unsigned char)expected toEqual:(unsigned char)actual;

+ (void)unsignedChar:(unsigned char)expected toNotEqual:(unsigned char)actual;

+ (void)unsignedChar:(unsigned char)expected toBeLessThan:(unsigned char)actual;

+ (void)unsignedChar:(unsigned char)expected toBeGreaterThan:(unsigned char)actual;

#pragma mark unsigned int

+ (void)unsignedInt:(unsigned int)expected toEqual:(unsigned int)actual;

+ (void)unsignedInt:(unsigned int)expected toNotEqual:(unsigned int)actual;

+ (void)unsignedInt:(unsigned int)expected toBeLessThan:(unsigned int)actual;

+ (void)unsignedInt:(unsigned int)expected toBeGreaterThan:(unsigned int)actual;

#pragma mark unsigned short

+ (void)unsignedShort:(unsigned short)expected toEqual:(unsigned short)actual;

+ (void)unsignedShort:(unsigned short)expected toNotEqual:(unsigned short)actual;

+ (void)unsignedShort:(unsigned short)expected toBeLessThan:(unsigned short)actual;

+ (void)unsignedShort:(unsigned short)expected toBeGreaterThan:(unsigned short)actual;

#pragma mark unsigned long

+ (void)unsignedLong:(unsigned long)expected toEqual:(unsigned long)actual;

+ (void)unsignedLong:(unsigned long)expected toNotEqual:(unsigned long)actual;

+ (void)unsignedLong:(unsigned long)expected toBeLessThan:(unsigned long)actual;

+ (void)unsignedLong:(unsigned long)expected toBeGreaterThan:(unsigned long)actual;

#pragma mark unsigned long long

+ (void)unsignedLongLong:(unsigned long long)expected toEqual:(unsigned long long)actual;

+ (void)unsignedLongLong:(unsigned long long)expected toNotEqual:(unsigned long long)actual;

+ (void)unsignedLongLong:(unsigned long long)expected toBeLessThan:(unsigned long long)actual;

+ (void)unsignedLongLong:(unsigned long long)expected toBeGreaterThan:(unsigned long long)actual;

#pragma mark float

+ (void)float:(float)expected toEqual:(float)actual tolerance:(float)tolerance;

+ (void)float:(float)expected toNotEqual:(float)actual tolerance:(float)tolerance;

+ (void)float:(float)expected toBeLessThan:(float)actual;

+ (void)float:(float)expected toBeGreaterThan:(float)actual;

#pragma mark double

+ (void)double:(double)expected toEqual:(double)actual tolerance:(double)tolerance;

+ (void)double:(double)expected toNotEqual:(double)actual tolerance:(double)tolerance;

+ (void)double:(double)expected toBeLessThan:(double)actual;

+ (void)double:(double)expected toBeGreaterThan:(double)actual;

#pragma mark object

+ (void)object:(NSObject *)expected toEqual:(NSObject *)actual;

+ (void)object:(NSObject *)expected toNotEqual:(NSObject *)actual;

#pragma mark block

+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason;

+ (void)blockToNotThrowException:(void (^)())block;

@end
