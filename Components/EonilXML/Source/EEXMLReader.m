//
//  EEXMLReader.m
//  SubwayRoute
//
//  Created by Hoon Hwangbo on 12/20/12.
//  Copyright (c) 2012 Knewb. All rights reserved.
//

#import "EEXMLReaderObjectStack.h"
#import "EEXMLReader.h"





@implementation EEXMLReader
{
//	void (^fetchBlock)(id object);
	
	NSXMLParser*			parser;
	EEXMLReaderObjectStack*	elestack;
}
//- (void)fetchXMLElementByReadingData:(NSData *)data withBlock:(void (^)(EEXMLElement *))block
//{
//	UNIVERSE_DEBUG_ASSERT_OBJECT_TYPE(data, NSData);
//	EE_ASSERT_NON_NIL(block);
//	
//	EE_EXCEPT(self->parser != nil, @"You can't issue parse method while another parsing is on-going.")
//	EE_ASSERT(self->elestack != nil, @"There's serious logic bug.");
//	EE_EXCEPT(self->fetchBlock != nil, @"There's serious logic bug.");
//	
//	self->elestack		=	[[EEXMLReaderObjectStack alloc] init];
//	self->fetchBlock	=	[block copy];
//	self->parser		=	[[NSXMLParser alloc] initWithData:data];
//	self->parser.delegate	=	self;
//	[self->parser parse];
//}
- (EEXMLElement *)XMLElementByReadingData:(NSData *)data
{	
	UNIVERSE_DEBUG_ASSERT_OBJECT_TYPE(data, NSData);
	
	UNIVERSE_DEBUG_ASSERT(self->parser == nil);		//	You can't issue parse method while another parsing is on-going.
	UNIVERSE_DEBUG_ASSERT(self->elestack == nil);	//	There's serious logic bug.
	
	self->elestack		=	[[EEXMLReaderObjectStack alloc] init];
	self->parser		=	[[NSXMLParser alloc] initWithData:data];
	self->parser.delegate	=	self;
	[self->parser parse];
	
	EEXMLElement*	ele	=	[self->elestack topObject];
	
	self->parser		=	nil;
	self->elestack		=	nil;
	return	ele;
}



- (void)parserDidStartDocument:(NSXMLParser *)parser
{
	
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
//	self->fetchBlock([self->elestack topObject]);
//	
//	//	Clear all states.
//	self->parser		=	nil;
//	self->elestack		=	nil;
//	self->fetchBlock	=	nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	EEXMLElement*	cele	=	[[EEXMLElement alloc] init];
	cele.tag				=	elementName;
	cele.attributes			=	attributeDict;
	
	EEXMLElement*	pele	=	[self->elestack topObject];
	[pele appendSubelement:cele];
	[self->elestack pushObject:cele];
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if (self->elestack.count > 1)
	{
		[self->elestack popObject];
	}
}

//- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue
//{
//
//}
- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
	EEXMLElement*	ele	=	[self->elestack topObject];
	[ele appendCDATANodeWithData:CDATABlock];
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	EEXMLElement*	ele	=	[self->elestack topObject];
	[ele appendTextNodeWithString:string];
}
//- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment
//{
//
//}
//- (void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model
//{
//}
//- (void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
//{
//
//}
//- (void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString
//{
//
//}
//- (void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name value:(NSString *)value
//{
//
//}
//- (void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
//{
//
//}
//- (void)parser:(NSXMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)target data:(NSString *)data
//{
//
//}
//- (void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID notationName:(NSString *)notationName
//{
//
//}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), parseError);
}
- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), validationError);
}
@end










