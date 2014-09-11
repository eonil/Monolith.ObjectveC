//
//  EEXMLReader.h
//  SubwayRoute
//
//  Created by Hoon Hwangbo on 12/20/12.
//  Copyright (c) 2012 Knewb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EEXMLNode.h"

/*!
 Performs asynchronous reading of XML document as node-tree.
 */
@interface	EEXMLReader : NSObject <NSXMLParserDelegate>
//- (void)	fetchXMLElementByReadingData:(NSData*)data withBlock:(void(^)(EEXMLElement* element))block;
- (EEXMLElement*)XMLElementByReadingData:(NSData*)data;
@end
