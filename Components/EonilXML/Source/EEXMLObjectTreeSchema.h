////
////  EEXMLObjectTreeSchema.h
////  SubwayRoute
////
////  Created by Hoon Hwangbo on 12/20/12.
////  Copyright (c) 2012 Knewb. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//
//@class		EEXMLObjectTreeSchema;
//@class		EEXMLObjectDefinition;
//@class		EEXMLPropertyDefinition;
//@class		EEXMLAttributePropertyDefinition;
//@class		EEXMLElementPropertyDefinition;
//@class		EEXMLElementProcessingDefinition;
//typedef		enum EEXMLValueCapturingSource EEXMLValueCapturingSource;
//typedef		enum EEXMLOccurenceStyle EEXMLOccurenceStyle;
//typedef		id (^EEXMLValueConverter)(id object);
//
//
///*!
// Converts an XML element-tree into an object-tree.
// 
// @discussion
// All added definitions will be copied into this object.
// 
// @note
// You can't define multiple object-definition for same element-name.
// Also, you can't define multiple object-definition for same class.
// */
//@interface	EEXMLObjectTreeSchema : NSObject <NSCopying>
//@property	(readonly,nonatomic,copy)			NSArray*					objectDefinitions;
//- (EEXMLObjectDefinition*)objectDefinitionForElementName:(NSString*)elementName;
//- (EEXMLObjectDefinition*)objectDefinitionForClass:(Class)typeClass;
//- (void)	addObjectDefinition:(EEXMLObjectDefinition*)objectDefinition;
//- (void)	addObjectDefinitionForClass:(Class)typeClass withElementName:(NSString*)elementName setupBlock:(void(^)(EEXMLObjectDefinition* odef))block;
//@end
//
//
//
//
//
//
//
///*!
// All appended definitions will be copied into this object.
//
// @note
// You can't define multiple object-definition for same proeprty-name or value-identifier identifier within same value-source.
// You can't define multiple property-definition for same attribute or element name.
// */
//@interface	EEXMLObjectDefinition : NSObject <NSCopying>
//@property	(readwrite,nonatomic,copy)		Class			typeClass;
//@property	(readwrite,nonatomic,copy)		NSString*		elementName;
//@property	(readwrite,nonatomic,copy)		NSArray*		propertyDefinitions;
//- (EEXMLPropertyDefinition*)propertyDefinitionForName:(NSString*)propertyName;
//- (EEXMLPropertyDefinition*)propertyDefinitionByValueSource:(EEXMLValueCapturingSource)valueSource identifier:(NSString*)valueIdentifier;
//- (void)	addPropertyDefinition:(EEXMLPropertyDefinition*)propertyDefinition;
//- (void)	addPropertyDefinitionForName:(NSString*)propertyName valueSource:(EEXMLValueCapturingSource)valueSource valueIdentifier:(NSString*)valueIdentifier valueConverter:(EEXMLValueConverter)valueConverter;
//@end
//
//
//
//
//
//
//
//
//enum
//EEXMLOccurenceStyle
//{
//	EEXMLOccurenceStyleSingle,
//	EEXMLOccurenceStyleMultiple,
//};
//
//
//enum
//EEXMLValueCapturingSource
//{
//	EEXMLValueCapturingSourceAttribute,				//	Reads value from specified attribute.
//	EEXMLValueCapturingSourceElementNode,			//	Reads value from specified element's node structure. Treat the element as an object.
//	EEXMLValueCapturingSourceElementText,			//	Reads value from specified element's concatenated text.
//	EEXMLValueCapturingSourceElementCDATA,			//	Reads value from specified element's concatenated CDATA.
//	EEXMLValueCapturingSourceRawXMLElement,			//	Reads value from specified element's raw object. Object type is different by converter implementation, not may not be supported by converters.
//};
//
//
//
///*!
// Abstract class.
// */
//@interface	EEXMLPropertyDefinition : NSObject <NSCopying>
//@property	(readwrite,nonatomic,copy)		NSString*					propertyName;
//@property	(readwrite,nonatomic,copy)		NSString*					valueIdentifier;
//@property	(readwrite,nonatomic,assign)	EEXMLValueCapturingSource	valueSource;
//@property	(readwrite,nonatomic,copy)		EEXMLValueConverter			valueConverter;
//@property	(readwrite,nonatomic,assign)	EEXMLOccurenceStyle			occurrenceStyle;
//@end
//
////@interface	EEXMLAttributePropertyDefinition : EEXMLPropertyDefinition
////@property	(readwrite,nonatomic,copy)		NSString*		attributeName;
////@end
////
/////*!
//// Set property value by reading from object element's specific subelement's text content.
//// */
////@interface	EEXMLElementPropertyDefinition : EEXMLPropertyDefinition
////@property	(readwrite,nonatomic,copy)		NSString*		elementName;
////@property	(readwrite,nonatomic,assign)	BOOL			isArray;					//	Treat property as array of the element.
//////@property	(readwrite,nonatomic,assign)	BOOL			isValue;					//	Treat the element node as a simple text. If this is NO, the element will be treated as an object.
////@end
////
/////*!
//// Set property value by reading from object element's specific subelement's text content.
//// */
////@interface	EEXMLElementObjectPropertyDefinition : EEXMLPropertyDefinition
////@property	(readwrite,nonatomic,copy)		NSString*		elementName;
////@property	(readwrite,nonatomic,assign)	BOOL			isArray;					//	Treat property as array of the element.
//////@property	(readwrite,nonatomic,assign)	BOOL			isValue;					//	Treat the element node as a simple text. If this is NO, the element will be treated as an object.
////@end
////
/////*!
//// Captures specified element's all text and set the property's value with it.
//// */
////@interface	EEXMLElementTextPropertyDefinition : EEXMLElementPropertyDefinition
////@end
////
/////*!
//// Captures specified element's all CDATA and set the property's value with it.
//// */
////@interface	EEXMLElementCDATAPropertyDefinition : EEXMLElementPropertyDefinition
////@end
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
