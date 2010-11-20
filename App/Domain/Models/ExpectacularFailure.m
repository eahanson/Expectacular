#import "ExpectacularFailure.h"


@implementation ExpectacularFailure

+ (id)expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual {
    return [[self class] exceptionWithName:@"Expectation failed" 
                                    reason:[NSString stringWithFormat:@"expected: %@\n%@: %@", expected, matcher, actual] 
                                  userInfo:nil];
}

@end
