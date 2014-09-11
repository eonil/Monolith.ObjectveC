//
//  EEXMLReaderObjectStack.h
//  SubwayRoute
//
//  Created by Hoon Hwangbo on 12/20/12.
//  Copyright (c) 2012 Knewb. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 An object stack which support nil value.
 
 @discussion
 This object doesn't support NSNull. If you push any NSNull, it will raise an exception.
 */
@interface	EEXMLReaderObjectStack : NSObject
- (NSUInteger)count;
- (id)		topObject;
- (void)	pushObject:(id)object;
- (void)	popObject;
@end
