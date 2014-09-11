//
//  EEXMLNode.m
//  SubwayRoute
//
//  Created by Hoon Hwangbo on 12/20/12.
//  Copyright (c) 2012 Knewb. All rights reserved.
//

#import "EEXMLNode.h"





@implementation EEXMLNode
@end

@implementation EEXMLElement
{
	NSMutableDictionary*	attributes;
	NSMutableArray*			subnodes;
}
- (NSDictionary *)attributes
{
	return	self->attributes;
}
- (void)setAttributes:(NSDictionary *)newAttributes
{
	self->attributes	=	[newAttributes mutableCopy];
}
- (NSArray *)subnodes
{
	return	self->subnodes;
}
- (void)setSubnodes:(NSArray *)newSubnodes
{
	self->subnodes		=	[newSubnodes mutableCopy];
}
- (void)appendCDATANodeWithData:(NSData *)content
{
	EEXMLCDATANode*		node	=	[[EEXMLCDATANode alloc] init];
	node.dataContent			=	content;
	[self->subnodes addObject:node];
}
- (void)appendTextNodeWithString:(NSString *)content
{
	EEXMLTextNode*		node	=	[[EEXMLTextNode alloc] init];
	node.stringContent			=	content;
	[self->subnodes addObject:node];
}
- (void)appendSubelement:(EEXMLElement *)element
{
	[self->subnodes addObject:element];
}
- (void)deleteNodeAtIndex:(NSUInteger)index
{
	[self->subnodes removeObjectAtIndex:index];
}
- (void)setAttributeValue:(NSString *)value forName:(NSString *)name
{
	if (value == nil)
	{
		[self->attributes removeObjectForKey:name];
	}
	else
	{
		[self->attributes setObject:value forKey:name];
	}
}
- (NSString *)stringByConcatenatingContentsOfAllTextNodes
{
	NSMutableString*	str		=	[[NSMutableString alloc] init];
	for (id N in self.subnodes)
	{
		if ([N isKindOfClass:[EEXMLTextNode class]])
		{
			[str appendString:[N stringContent]];
		}
	}
	return	str;
}
- (NSData *)dataByConcatenatingContentsOfAllCDATANodes
{
	NSMutableData*		dat		=	[[NSMutableData alloc] init];
	for (id N in self.subnodes)
	{
		if ([N isKindOfClass:[EEXMLCDATANode class]])
		{
			[dat appendData:[N dataContent]];
		}
	}
	return	dat;
}
- (NSArray *)allSubelements
{
	return
	[self.subnodes filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings)
	{
		return	[evaluatedObject isKindOfClass:[EEXMLElement class]];
	}]];
//	NSMutableArray*		ses		=	[[NSMutableArray alloc] init];
//	for (id N in self.subnodes)
//	{
//		
//	}
//	return	ses;
}
- (EEXMLElement *)subelementForTag:(NSString *)tag
{
	for (EEXMLElement* sele in self.allSubelements)
	{
		if ([sele.tag isEqualToString:tag])
		{
			return	sele;
		}
	}
	return	nil;
}
- (NSArray *)allSubelementsForTag:(NSString *)tag
{
	return
	[self.allSubelements filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings)
	{
		EEXMLElement*	sele	=	evaluatedObject;
		return	[sele.tag isEqualToString:tag];
	}]];
}
- (id)init
{
	if ((self = [super init]))
	{
		self->attributes	=	[[NSMutableDictionary alloc] init];
		self->subnodes		=	[[NSMutableArray alloc] init];
	}
	return	self;
}
@end








@implementation EEXMLCDATANode
@end

@implementation EEXMLTextNode
@end






