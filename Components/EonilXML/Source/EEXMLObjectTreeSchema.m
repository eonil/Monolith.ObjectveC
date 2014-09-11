////
////  EEXMLProcessingSchema.m
////  SubwayRoute
////
////  Created by Hoon Hwangbo on 12/20/12.
////  Copyright (c) 2012 Knewb. All rights reserved.
////
//
//#import <objc/runtime.h>
//#import "EEXMLObjectTreeSchema.h"
//
//
//@implementation EEXMLObjectTreeSchema
//- (EEXMLObjectDefinition *)objectDefinitionForElementName:(NSString *)elementName
//{
//	for (EEXMLObjectDefinition* odef in [self objectDefinitions])
//	{
//		if ([odef.elementName isEqualToString:elementName])
//		{
//			return	odef;
//		}
//	}
//	return	nil;
//}
//- (EEXMLObjectDefinition *)objectDefinitionForClass:(Class)typeClass
//{
//	for (EEXMLObjectDefinition* odef in [self objectDefinitions])
//	{
//		if (odef.typeClass == typeClass)
//		{
//			return	odef;
//		}
//	}
//	return	nil;
//}
//- (void)addObjectDefinition:(EEXMLObjectDefinition *)objectDefinition
//{
//	UNIVERSE_DEBUG_ASSERT_OBJECT_TYPE(objectDefinition, EEXMLObjectDefinition);
//	EE_EXCEPT([self objectDefinitionForElementName:objectDefinition.elementName] != nil, @"You can't add definition for duplicated element-name.")
//	EE_EXCEPT([self objectDefinitionForElementName:objectDefinition.elementName] != nil, @"You can't add definition for duplicated class.")
//	self->_objectDefinitions	=	[self->_objectDefinitions arrayByAddingObject:objectDefinition];
//}
//- (void)addObjectDefinitionForClass:(Class)typeClass withElementName:(NSString *)elementName setupBlock:(void (^)(EEXMLObjectDefinition *))block
//{
//	EEXMLObjectDefinition*	odef	=	[[EEXMLObjectDefinition alloc] init];
//	odef.typeClass		=	typeClass;
//	odef.elementName	=	elementName;
//	block(odef);
//	[self addObjectDefinition:odef];
//}
//- (id)copyWithZone:(NSZone *)zone
//{
//	return	[self copy];
//}
//- (id)copy
//{
//	EEXMLObjectTreeSchema*	cp	=	[[[self class] alloc] init];
//	cp->_objectDefinitions		=	[[EECollectionUtility defaultUtility] arrayByConvertingElementsInArray:self->_objectDefinitions withBlock:^id(id object, NSUInteger index)
//									 {
//										 return	[object copy];
//									 }];
//	return	cp;
//}
//- (id)init
//{
//	if ((self = [super init]))
//	{
//		self->_objectDefinitions	=	@[];
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
//
//
//
//
//
//
//@implementation EEXMLObjectDefinition
//- (EEXMLPropertyDefinition *)propertyDefinitionForName:(NSString *)propertyName
//{
//	for (EEXMLPropertyDefinition* pdef in [self propertyDefinitions])
//	{
//		if ([pdef.propertyName isEqualToString:propertyName])
//		{
//			return	pdef;
//		}
//	}
//	return	nil;
//}
//- (EEXMLPropertyDefinition *)propertyDefinitionByValueSource:(EEXMLValueCapturingSource)valueSource identifier:(NSString *)valueIdentifier
//{
//	for (EEXMLPropertyDefinition* pdef in [self propertyDefinitions])
//	{
//		if (pdef.valueSource == valueSource && [pdef.valueIdentifier isEqualToString:valueIdentifier])
//		{
//			return	pdef;
//		}
//	}
//	return	nil;
//}
//- (void)addPropertyDefinition:(EEXMLPropertyDefinition *)propertyDefinition
//{
//	UNIVERSE_DEBUG_ASSERT_OBJECT_TYPE(propertyDefinition, EEXMLPropertyDefinition);
//	UNIVERSE_DEBUG_ASSERT_OBJECT_TYPE(propertyDefinition.propertyName, NSString);
//	EE_ASSERT(propertyDefinition.propertyName.length > 0, @"Property-name cannot be empty.");
//
//	if ([self propertyDefinitionForName:propertyDefinition.propertyName])
//	{
//		EE_EXCEPT_UNCONDITIONALLY(@"A property-definition for the property name already exist.");
//	}
//	if ([self propertyDefinitionByValueSource:propertyDefinition.valueSource identifier:propertyDefinition.valueIdentifier])
//	{
//		EE_EXCEPT_UNCONDITIONALLY(@"A property-definition with the value-source and value-identifier already exist.");
//	}
//	EE_EXCEPT(propertyDefinition.valueSource == EEXMLValueCapturingSourceAttribute && propertyDefinition.occurrenceStyle == EEXMLOccurenceStyleMultiple, @"A proeprty-definition with EEXMLValueCapturingSourceAttribute value-source cannot have EEXMLOccurenceStyleMultiple occurence-style.");
//	
//	////
//	
//	self->_propertyDefinitions	=	[self->_propertyDefinitions arrayByAddingObject:propertyDefinition.copy];
//}
//- (void)addPropertyDefinitionForName:(NSString *)propertyName valueSource:(EEXMLValueCapturingSource)valueSource valueIdentifier:(NSString *)valueIdentifier valueConverter:(EEXMLValueConverter)valueConverter
//{
//	EEXMLPropertyDefinition*	pdef	=	[[EEXMLPropertyDefinition alloc] init];
//	pdef.propertyName		=	propertyName;
//	pdef.valueSource		=	valueSource;
//	pdef.valueIdentifier	=	valueIdentifier;
//	pdef.valueConverter		=	valueConverter;
//	[self addPropertyDefinition:pdef];
//}
//- (id)copyWithZone:(NSZone *)zone
//{
//	return	self.copy;
//}
//- (id)copy
//{
//	EEXMLObjectDefinition*	odef	=	[[EEXMLObjectDefinition alloc] init];
//	odef.typeClass					=	self.typeClass;
//	odef.elementName				=	self.elementName;
//	odef.propertyDefinitions		=	[[EECollectionUtility defaultUtility] arrayByConvertingElementsInArray:self.propertyDefinitions withBlock:^id(id object, NSUInteger index)
//	{
//		return	[object copy];
//	}];
//	
//	return	odef;
//}
//- (id)init
//{
//	if ((self = [super init]))
//	{
//		self->_propertyDefinitions	=	@[];
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
//@implementation EEXMLPropertyDefinition
//- (id)copyWithZone:(NSZone *)zone
//{
//	return	[self copy];
//}
//- (id)copy
//{
//	EEXMLPropertyDefinition*	pdef	=	[[EEXMLPropertyDefinition alloc] init];
//	
//	pdef.propertyName		=	self.propertyName;
//	pdef.valueIdentifier	=	self.valueIdentifier;
//	pdef.valueSource		=	self.valueSource;
//	pdef.valueConverter		=	self.valueConverter;
//	pdef.occurrenceStyle	=	self.occurrenceStyle;
//	
//	return	pdef;
//}
//@end
//
//
//
//
//
//
//
