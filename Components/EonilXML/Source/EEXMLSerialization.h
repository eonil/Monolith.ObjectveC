////
////  EEXMLSerialization.h
////  SubwayRoute
////
////  Created by Hoon Hwangbo on 12/19/12.
////  Copyright (c) 2012 Knewb. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//#import "EEXMLObjectTreeSchema.h"
//
//
//
//
//
//
//
//
//typedef		void (^EEXMLSerializationObjectFetchBlock)(id object);
//
//
///*!
// Performs conversion of XML document into object-tree.
// 
// @discussion
// XML doesn't fit to PList directly. It contains more metadata which expected on PList,
// So some of them should be avoided. And also, XML offers multiple way to represent data
// structure which is identical in PList. This means you have to define how to parse them
// into PList.
// */
//@interface	EEXMLSerialization : NSObject <NSXMLParserDelegate>
//@property	(readonly,nonatomic,copy)			EEXMLObjectTreeSchema*		processingSchema;
///*!
// You can't send this message while parsing is on-going.
// */
//- (void)	fetchObjectByReadingData:(NSData*)data withBlock:(void(^)(id object))block;
///*!
// Supplied schema will be copied into this object.
// */
//- (id)		initWithProcessingSchema:(EEXMLObjectTreeSchema*)processingSchema;
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
