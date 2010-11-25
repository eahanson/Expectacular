#import "ExpectacularFailure.h"


@implementation ExpectacularFailure

+ (id)expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual {
    return [[self class] exceptionWithName:@"Expectation failed" 
                                    reason:[NSString stringWithFormat:@"expected: %@\n%@: %@", expected, matcher, actual] 
                                  userInfo:nil];
}

+ (id)expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual tolerance:(NSString *)tolerance {
    return [[self class] exceptionWithName:@"Expectation failed" 
                                    reason:[NSString stringWithFormat:@"expected: %@\n%@: %@\nwith tolerance: %@", expected, matcher, actual, tolerance] 
                                  userInfo:nil];
}

+ (id)messageWithFormat:(NSString *)format, ... {
    va_list vl;
    va_start(vl, format);
    NSString* formattedString = [[[NSString alloc] initWithFormat:format arguments:vl] autorelease];
    va_end(vl);
    
    return [[self class] exceptionWithName:@"Expectation failed"
                                    reason:formattedString
                                  userInfo:nil];
}

@end
