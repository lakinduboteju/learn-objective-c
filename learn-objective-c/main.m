/*
 * File : main.m
 * Project : learn-objective-c
 * Description : Learning Objective-C language syntax and core libraries.
 *
 * Created by Lakindu Boteju on 5/1/22
 */

// #import <Foundation/Foundation.h>
@import Foundation;

int main(int argc, const char * argv[]) {
    // Autorelease pool to manage memory
    // NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    // [pool drain]; // Clean up memory
    @autoreleasepool {
        // Types, Variables
        short        shortNumb  = 256;
        int          intNumb    = 1024;
        unsigned int uintNumb   = 2048;
        long         longNumb   = 248000000;
        float        floatNumb  = 2.145678f;
        double       doubleNumb = 4.678965248;
        char         charNumb   = 'a';
        bool         boolean    = false;
        const char * cstr       = "Hello, World!";

        NSNumber * nsShortNumb = @256;
        nsShortNumb            = [NSNumber numberWithShort:256];
        shortNumb              = [nsShortNumb shortValue];

        NSNumber * nsIntNumb   = @1024;
        nsIntNumb              = [NSNumber numberWithInt:1024];
        intNumb                = [nsIntNumb intValue];
        longNumb               = [nsIntNumb longValue];
        floatNumb              = [nsIntNumb floatValue];
        doubleNumb             = [nsIntNumb doubleValue];

        NSNumber * nsNumb      = [NSNumber numberWithUnsignedInt:2048];        // @2048U
        nsNumb                 = [NSNumber numberWithLong       :248000000];   // @248000000L
        nsNumb                 = [NSNumber numberWithFloat      :2.145678];    // @2.145678F
        nsNumb                 = [NSNumber numberWithDouble     :4.678965248]; // @4.678965248
        nsNumb                 = [NSNumber numberWithChar       :'a'];         // @'a'
        nsNumb                 = [NSNumber numberWithBool       :false];       // @NO / @YES

        BOOL objcBool          = NO; // YES

        // Immutable string
        NSString * nsString    = @"Hello, World!";
        nsString               = [NSString stringWithUTF8String:cstr];

        // Mutable string
        NSMutableString * nsMutString = [NSMutableString stringWithString:@"Hello, "];
        [nsMutString appendString:@"World"];
        [nsMutString appendString:@"!"];

        NSLog(@"%@", nsMutString); // print Hello, World!

        // Number to string
        nsString    = [nsIntNumb stringValue];
        nsString    = [@4.678965248 stringValue];
        nsMutString = [NSMutableString stringWithString:nsString];

        // String to number
        nsNumb      = [NSNumber numberWithDouble:[@"4.678965248" doubleValue]]; // @([@"4.678965248" doubleValue])
    }

    return 0;
}
