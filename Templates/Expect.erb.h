#import <Foundation/Foundation.h>

@interface Expect : NSObject

#pragma mark bool 

+ (void)bool:(BOOL)expected toEqual:(BOOL)actual;

+ (void)bool:(BOOL)expected toNotEqual:(BOOL)actual;

<% @types.each do |type| %>
#pragma mark <%= type[:type] %>
    <% @matchers.each do |matcher| %>
+ (void)<%= type[:name] %>:(<%= type[:type] %>)expected <%= matcher[:matcher] %>:(<%= type[:type] %>)actual;
    <% end %>
<% end %>


#pragma mark object

+ (void)object:(NSObject *)expected toEqual:(NSObject *)actual;

+ (void)object:(NSObject *)expected toNotEqual:(NSObject *)actual;


#pragma mark block

+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason;

+ (void)blockToNotThrowException:(void (^)())block;

@end
