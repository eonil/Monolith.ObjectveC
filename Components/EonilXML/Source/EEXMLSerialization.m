////
////  EEXMLSerialization.m
////  SubwayRoute
////
////  Created by Hoon Hwangbo on 12/19/12.
////  Copyright (c) 2012 Knewb. All rights reserved.
////
//
//#import "EEXMLSerialization.h"
//
//
//
//
//
//
//
//@implementation EEXMLSerialization
//{
//	NSXMLParser*			parser;
//	void (^fetchBlock)(id object);
//	
//	EEXMLReaderObjectStack*	objstack;
//	EEXMLReaderObjectStack*	odefstack;
//}
//- (void)fetchObjectByReadingData:(NSData *)data withBlock:(void (^)(id))block
//{
//	UNIVERSE_DEBUG_ASSERT_OBJECT_TYPE(data, NSData);
//	EE_ASSERT_NON_NIL(block);
//	
//	EE_EXCEPT(self->parser != nil, @"You can't issue parse method while another parsing is on-going.")
//	EE_ASSERT(self->objstack != nil, @"There's serious logic bug.");
//	EE_EXCEPT(self->odefstack != nil, @"There's serious logic bug.");
//	EE_EXCEPT(self->fetchBlock != nil, @"There's serious logic bug.");
//
//	self->objstack		=	[[EEXMLReaderObjectStack alloc] init];
//	self->odefstack		=	[[EEXMLReaderObjectStack alloc] init];
//	self->fetchBlock	=	[block copy];
//	self->parser		=	[[NSXMLParser alloc] initWithData:data];
//	self->parser.delegate	=	self;
//	[self->parser parse];
//}
//- (id)initWithProcessingSchema:(EEXMLObjectTreeSchema *)processingSchema
//{
//	UNIVERSE_DEBUG_ASSERT_OBJECT_TYPE(processingSchema, EEXMLObjectTreeSchema);
//	if ((self = [super init]))
//	{
//		self->_processingSchema	=	[processingSchema copy];
//	}
//	return	self;
//}
//
//- (void)parserDidStartDocument:(NSXMLParser *)parser
//{
//	
//}
//- (void)parserDidEndDocument:(NSXMLParser *)parser
//{
//	//	Clear all states.
//	
//	self->parser		=	nil;
//	self->objstack		=	nil;
//	self->odefstack		=	nil;
//	self->fetchBlock	=	nil;
//}
//
//- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
//{
//	//	Resolve parent object and definition.
//	EEXMLObjectDefinition*	podef	=	[self->odefstack topObject];
//	id						pobj	=	[self->objstack topObject];
//	
//	//	Resolve current object and definition,
//	//	and push them.
//	EEXMLObjectDefinition*	odef	=	[[self processingSchema] objectDefinitionForElementName:elementName];
//	id						obj		=	[[odef.typeClass alloc] init];
//	[self->objstack pushObject:obj];
//	[self->odefstack pushObject:odef];
//
//	//	Only when current object and definition are exist.
//	if (obj)
//	{
//		//	Resolve current object's proeprty values from attrbitues.
//		for (NSString* aname in attributeDict.keyEnumerator)
//		{
//			EEXMLAttributePropertyDefinition*	apdef	=	[odef attributePropertyDefinitionForAttributeName:aname];
//			if (apdef)
//			{
//				EEXMLValueConverter	vconv	=	[apdef valueConverter] ? vconv : ^(id V){ return V; };
//				NSString*			aval	=	attributeDict[aname];
//				id					val2	=	vconv(aval);
//				[obj setValue:val2 forKey:apdef.propertyName];
//			}
//		}
//	}
//}
//- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
//{
//	[self->objlvls removeLastObject];
//}
//
////- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue
////{
////	
////}
////- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
////{
////	
////}
//- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
//{
//	
//}
////- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment
////{
////	
////}
////- (void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model
////{
////}
////- (void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
////{
////	
////}
////- (void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString
////{
////	
////}
////- (void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name value:(NSString *)value
////{
////	
////}
////- (void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
////{
////	
////}
////- (void)parser:(NSXMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)target data:(NSString *)data
////{
////	
////}
////- (void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID notationName:(NSString *)notationName
////{
////	
////}
//- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
//{
//	
//}
//- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
//{
//	
//}
//@end
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
