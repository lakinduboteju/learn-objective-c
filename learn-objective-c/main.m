/*
 * File : main.m
 * Project : learn-objective-c
 * Description : Learning Objective-C language syntax and core libraries.
 *
 * Created by Lakindu Boteju on 5/1/22
 */

// #import <Foundation/Foundation.h>
@import Foundation;

#import "MyClass.h"

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

        // NSDecimalNumber
        // Immutable fixed decimal point type that is more precise than float or double
        NSDecimalNumber * nsDecNumber = [NSDecimalNumber decimalNumberWithString:@"9.99"];
        NSDecimalNumber * nsDecTmp    = [NSDecimalNumber decimalNumberWithString:@"2.00"];
        // NSDecimalNumber arithmetic operations
        nsDecNumber                   = [nsDecNumber decimalNumberByAdding:nsDecTmp];     // 11.99
        nsDecNumber                   = [nsDecNumber decimalNumberByDividingBy:nsDecTmp]; // 5.995
        [nsDecNumber decimalNumberBySubtracting:nsDecTmp];
        [nsDecNumber decimalNumberByMultiplyingBy:nsDecTmp];
        [nsDecNumber decimalNumberByRaisingToPower:2];

        NSLog(@"100.00 / 3.00 = %@", [ [NSDecimalNumber decimalNumberWithString:@"100.00"]
                                       decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"3.00"] ]); // 33.33333333333334
        
        // Cannot perform arithmetic operation with NSNumber type
        2 + 5;
        id two         = [NSDecimalNumber decimalNumberWithDecimal:[@2 decimalValue]];
        id five        = [NSDecimalNumber decimalNumberWithDecimal:[@5 decimalValue]];
        id twoPlusFive = [two decimalNumberByAdding:five]; // 2 + 5
        [twoPlusFive intValue];

        // NSArray
        // Immutable fixed size array that can contain different types
        NSArray * arr        = @[@3.14, @"Hello", @YES, @2056];
        NSString * secondObj = arr[2];
        // NSArray can be typed
        NSArray<NSString *> * nsArr = @[@"Hello", @"World"];
        // NSMutableArray
        // Mutable array that allows to change items and extend/shrink (add/remove items)
        NSMutableArray * nsMutArr = [NSMutableArray arrayWithCapacity:2];
        [nsMutArr addObject:@"Hello"];
        [nsMutArr addObject:@"World"];
        [nsMutArr removeObjectAtIndex:1];
        
        nsMutArr = [nsArr mutableCopy]; // NSArray to NSMutableArray
        nsArr    = [nsMutArr copy];     // NSMutableArray to NSArray
        
        // NSDictionary
        // Immutable fixed size map that can contain differnt types
        NSDictionary * dict    = @{@1 : @"1", @"2" : @2};
        NSObject * firstObj    = dict[@1];
        NSString * firstObjStr = dict[@1];
        // NSDictionary can be typed
        NSDictionary<NSNumber *, NSString *> * nsDict = @{@1 : @"1", @2 : @"2"};
        // NSMutableDictionary
        NSMutableDictionary<NSNumber *, NSString *> * nsMutDict = [NSMutableDictionary dictionaryWithCapacity:2];
        [nsMutDict setObject:@1 forKey:@"Hello"];
        [nsMutDict setObject:@2 forKey:@"World"];
        [nsMutDict removeObjectForKey:@2];

        nsMutDict = [nsDict mutableCopy]; // NSDictionary to NSMutableDictionary
        nsDict    = [nsMutDict copy];     // NSMutableDictionary to NSDictionary
        
        // NSSet
        // Immutable fixed size set that can contain values of only one type
        NSSet<NSString *> * nsSet = [NSSet setWithObjects:@"Hello", @"World",
                                     nil];
        [nsSet containsObject:@"Hello"];
        // NSMutableSet
        // Mutable set that allows to change items and extend/shrink (add/remove items)
        NSMutableSet * nsMutSet = [NSMutableSet setWithCapacity:2];
        [nsMutSet addObject:@"Hello"];
        [nsMutSet addObject:@"World"];
        [nsMutSet removeObject:@"World"];
        
        nsMutSet = [nsSet mutableCopy]; // NSSet to NSMutableSet
        nsSet    = [nsMutSet copy];     // NSMutableSet to NSSet
        
        // Operators
        2 == 3;     // NO
        2 != 3;     // YES
        1 && 1;     // YES
        0 || 1;     // YES
        0 || !@YES; // NO
        
        // Decisions & Loops
        if (@NO) { /* I am never run */ } else if (0) { /* I am never run */ } else { /* I run */ }
        
        switch (2) { // switch can be used only with int
            case 0:  /* I am never run */  break;
            case 1:  /* I am never run */  break;
            case 2:  /* I run */           break;
            default: /* I am never run */  break;
        }
        
        int i = 0;
        while (i < 4) { i++; }
        
        for (int i = 0; i < 4; i++) {}
        
        NSArray * numbs = @[@1, @2, @3, @4];
        for (NSNumber * numb in numbs) { }
        
        // Exceptions
        @try {
            // (NSException *)exceptionWithName:(NSExceptionName)name
            //                                   reason:(nullable NSString *)reason
            //                                   userInfo:(nullable NSDictionary *)userInfo
            @throw [NSException exceptionWithName:@"MyException" reason:@"My Exception" userInfo:NULL];
        } @catch (NSException * e) {
            NSLog(@"Exception : %@", e);
        } @finally {
        }
        
        // Errors
        NSError * err = [NSError errorWithDomain:@"Invalid arguments" code:1 userInfo:NULL];
        err           = [NSError errorWithDomain:@"Success" code:0 userInfo:nil];
        NSLog(@"Error : %@", err);
    }

    return 0;
}
