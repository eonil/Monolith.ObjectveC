////
////  EEXMLObjectTreeConverter.m
////  SubwayRoute
////
////  Created by Hoon Hwangbo on 12/20/12.
////  Copyright (c) 2012 Knewb. All rights reserved.
////
//
//#import "EEXMLObjectTreeConverter.h"
//
//@implementation EEXMLObjectTreeConverter
//{
//	EEXMLObjectTreeSchema*	K;
//}
//- (id)objectTreeByConvertingXMLElementTree:(EEXMLElement *)element
//{
//	EEXMLObjectDefinition*	odef	=	[K objectDefinitionForElementName:element.tag];
//	id						obj		=	[[odef.typeClass alloc] init];
//	
//	for (EEXMLPropertyDefinition* pdef in odef.propertyDefinitions)
//	{
//		id (^resolveRawValue)() = ^
//		{
//			switch (pdef.valueSource)
//			{
//				case
//				EEXMLValueCapturingSourceAttribute:
//				{
//					return	element.attributes[pdef.valueIdentifier];
//				}
//				case
//				EEXMLValueCapturingSourceElementText:
//				{
//					switch (pdef.occurrenceStyle)
//					{
//						case	EEXMLOccurenceStyleSingle:		return	(id)[element subelementForTag:pdef.valueIdentifier].stringByConcatenatingContentsOfAllTextNodes;
//						case	EEXMLOccurenceStyleMultiple:	return	(id)[[EECollectionUtility defaultUtility] arrayByConvertingElementsInArray:[element allSubelementsForTag:pdef.valueIdentifier] withBlock:^id(id object, NSUInteger index)
//						{
//							EEXMLElement*	ele	=	object;
//							return	ele.stringByConcatenatingContentsOfAllTextNodes;
//						}];
//					}
//				}
//				case
//				EEXMLValueCapturingSourceElementCDATA:
//				{
//					switch (pdef.occurrenceStyle)
//					{
//						case	EEXMLOccurenceStyleSingle:		return	(id)[element subelementForTag:pdef.valueIdentifier].dataByConcatenatingContentsOfAllCDATANodes;
//						case	EEXMLOccurenceStyleMultiple:	return	(id)[[EECollectionUtility defaultUtility] arrayByConvertingElementsInArray:[element allSubelementsForTag:pdef.valueIdentifier] withBlock:^id(id object, NSUInteger index)
//						{
//							EEXMLElement*	ele	=	object;
//							return	ele.dataByConcatenatingContentsOfAllCDATANodes;
//						}];
//					}
//				}
//				case
//				EEXMLValueCapturingSourceElementNode:
//				{
//					switch (pdef.occurrenceStyle)
//					{
//						case	EEXMLOccurenceStyleSingle:		return	(id)[self objectTreeByConvertingXMLElementTree:[element subelementForTag:pdef.valueIdentifier]];
//						case	EEXMLOccurenceStyleMultiple:	return	(id)[[EECollectionUtility defaultUtility] arrayByConvertingElementsInArray:[element allSubelementsForTag:pdef.valueIdentifier] withBlock:^id(id object, NSUInteger index)
//						{
//							EEXMLElement*	ele	=	object;
//							return	[self objectTreeByConvertingXMLElementTree:ele];
//						}];
//					}
//					break;
//				}
//				case
//				EEXMLValueCapturingSourceRawXMLElement:
//				{
//					return	(id)element;
//				}
//			}
//		};
//		
//		////
//		
//		id	V1	=	resolveRawValue();
//		id	V2	=	pdef.valueConverter(V1);
//		[obj setValue:V2 forKey:pdef.propertyName];
//	}
//	
//	return	obj;
//}
//- (id)initWithSchema:(EEXMLObjectTreeSchema *)schema
//{
//	if ((self = [super init]))
//	{
//		self->K	=	[schema copy];
//	}
//	return	self;
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
