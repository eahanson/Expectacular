# Expectacular

## About

Expectacular is a matcher library for Cocoa/Objective-C. The goal is to have a
full-featured matcher library that can be grokked easily by XCode's code completion.

### Examples

    [Expect int:[myArray count] toEqual:4];
    
    [Expect object:user.name toEqual:@"Fred"];
    
    [Expect block:^{
        [fluxCapacitor rethread];
    } toThrowExceptionWithReason:@"Uncharged capacitors cannot be rethreaded."];
    
    [Expect blockToNotThrowException:^{
        [fluxCapacitor charge];
        [fluxCapacitor rethread];
    }];

## Requirements

A version of Objective-C that supports blocks is required.

## Status

Just getting started. Lots of stuff is currently missing. Fork away!
