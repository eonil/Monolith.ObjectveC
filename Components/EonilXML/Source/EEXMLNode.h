//
//  EEXMLNode.h
//  SubwayRoute
//
//  Created by Hoon Hwangbo on 12/20/12.
//  Copyright (c) 2012 Knewb. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 Abstract class.
 */
@interface	EEXMLNode : NSObject
@end



@interface	EEXMLElement : EEXMLNode
@property	(readwrite,nonatomic,copy)		NSString*			tag;
@property	(readwrite,nonatomic,copy)		NSDictionary*		attributes;
@property	(readwrite,nonatomic,copy)		NSArray*			subnodes;		//	May be one of these types; EEXMLElement, EEXMLCDATANode, EEXMLTextNode.
- (void)	appendCDATANodeWithData:(NSData*)content;
- (void)	appendTextNodeWithString:(NSString*)content;
- (void)	appendSubelement:(EEXMLElement*)element;
- (void)	deleteNodeAtIndex:(NSUInteger)index;
- (void)	setAttributeValue:(NSString*)value forName:(NSString*)name;
- (NSString*)stringByConcatenatingContentsOfAllTextNodes;
- (NSData*)	dataByConcatenatingContentsOfAllCDATANodes;
- (NSArray*)allSubelements;
- (EEXMLElement*)subelementForTag:(NSString*)tag;
- (NSArray*)allSubelementsForTag:(NSString*)tag;
@end



@interface	EEXMLCDATANode : EEXMLNode
@property	(readwrite,nonatomic,copy)		NSData*				dataContent;
@end



@interface	EEXMLTextNode : EEXMLNode
@property	(readwrite,nonatomic,copy)		NSString*			stringContent;
@end




















