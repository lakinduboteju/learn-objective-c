#pragma once
/*
 * File : MyClass.h
 * Project : learn-objective-c
 *
 * Created by Lakindu Boteju on 5/3/22
 */

@interface MyClass : NSObject
{
    int                 count; // @protected
    @private id         data;  // can declare in implementation file as well
    @public NSString *  name;
}

@property                                       int propInt; // creates setter method setPropInt
@property (getter=getLength, setter=setLength:) int length; // way to specify getter setter method names
@property (copy)                                id copyId; // copies object during assignment
@property (readonly)                            NSString * roStr;

// Constructors
- (id) initWithCountAndName:    (int) count
                                name:(NSString *) name;

// Class methods / Static methods
+ (NSString *) classMethod: (NSNumber *) a1
                            a2:(NSString *) a2;
// Instance methods
- (NSString *) instanceMethod:  (NSNumber *) a1
                                a2:(NSString *) a2;
@end
