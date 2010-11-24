#import <Foundation/Foundation.h>

@interface Expect : NSObject

+ (void)bool:(BOOL)expected toEqual:(BOOL)actual;
+ (void)bool:(BOOL)expected toNotEqual:(BOOL)actual;

<% ["int"].each do |primitive_type| %>

+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toEqual:(<%= primitive_type %>)actual;
+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toNotEqual:(<%= primitive_type %>)actual;
+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toBeLessThan:(<%= primitive_type %>)actual;
+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toBeGreaterThan:(<%= primitive_type %>)actual;

<% end %>

+ (void)object:(NSObject *)expected toEqual:(NSObject *)actual;
+ (void)object:(NSObject *)expected toNotEqual:(NSObject *)actual;

+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason;
+ (void)blockToNotThrowException:(void (^)())block;

@end
