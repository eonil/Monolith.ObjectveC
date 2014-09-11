//
//  EEXMLReaderObjectStack.m
//  SubwayRoute
//
//  Created by Hoon Hwangbo on 12/20/12.
//  Copyright (c) 2012 Knewb. All rights reserved.
//

#import "EEXMLReaderObjectStack.h"




@implementation EEXMLReaderObjectStack
{
	NSMutableArray*	A;
}
- (NSUInteger)count
{
	return	[self->A count];
}
- (id)topObject
{
	return	A.count == 0 ? nil : [A lastObject];
}
- (void)pushObject:(id)object
{
	UNIVERSE_DEBUG_ASSERT([object isKindOfClass:[NSNull class]] == NO);		//	You can't push NSNull into here.
	
	////
	
	if (A == nil)
	{
		self->A	=	[[NSMutableArray alloc] init];
	}
	
	////
	
	id	V	=	object == nil ? [NSNull null] : object;
	[A addObject:V];
}
- (void)popObject
{
	[A removeLastObject];
}
- (NSString *)description
{
	return	[self->A description];
	//	return	[[NSString alloc] initWithFormat:@"<%@: %@>", ]
}
@end

