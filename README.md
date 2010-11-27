# Expectacular

## About

Expectacular is a matcher library for Cocoa/Objective-C. The goal is to have a
full-featured matcher library that can be grokked easily by XCode's code completion.

### Examples

    [Expect int:[myArray count] toEqual:4];
    
    [Expect object:user.name toEqual:@"Fred"];
    
    [Expect array:validTokens toContainObject:user.token];
    
    [Expect block:^{
        [fluxCapacitor rethread];
    } toThrowExceptionWithReason:@"Uncharged capacitors cannot be rethreaded."];
    
    [Expect blockToNotThrowException:^{
        [fluxCapacitor charge];
        [fluxCapacitor rethread];
    }];

## Documentation

See [Expect.h](https://github.com/eahanson/Expectacular/blob/master/Classes/Expect.h)

## Requirements

   * Cocoa
   * A version of Objective-C that supports blocks

## Installation

Copy everything from the "Classes" directory into your project, and then include `Expect.h`.

## Developing

Before making changes, you might want to check [Pivotal Tracker](https://www.pivotaltracker.com/projects/152569) 
to make sure nobody is working on that change.

Edit `Expect.erb.h` and `Expect.erb.m`. These are [ERB](http://corelib.rubyonrails.org/classes/ERB.html) templates 
that automate the task of generating all of the primitive matchers. The non-primitive matchers at this point are
all hand-written. After editing the file, run `rake gen` to generate the real `.h` and `.m` files. (You can also 
just run `rake` to generate and compile the files and run the tests.)

You can also run `rake clean` to clean the project.

The tests are all written in [Cedar](https://github.com/pivotal/cedar).

## Status

Just getting started. Lots of stuff is currently missing. Fork away!
