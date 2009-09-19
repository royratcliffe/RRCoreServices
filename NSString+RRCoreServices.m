// NSString+RRCoreServices.m
//
// Copyright © 2008, 2009, Roy Ratcliffe, Lancaster, United Kingdom
// All rights reserved
//
//------------------------------------------------------------------------------

#import "NSString+RRCoreServices.h"

@implementation NSString(RRCoreServices)

- (BOOL)launchServiceItemIsInvisible:(CFBooleanRef)boolean
{
	// FSPathMakeRef's first argument (path) contains the path-name to convert
	// as a UTF-8 C string.
	BOOL result = NO;
	FSRef fs;
	Boolean isDirectory;
	if (FSPathMakeRef((const UInt8 *)[self fileSystemRepresentation], &fs, &isDirectory) == noErr)
	{
		CFStringRef attrs[] =
		{
			kLSItemIsInvisible
		};
		CFArrayRef attrNames = CFArrayCreate(NULL, (const void **)attrs, sizeof(attrs)/sizeof(attrs[0]), NULL);
		CFDictionaryRef values = NULL;
		if (LSCopyItemAttributes(&fs, kLSRolesViewer, attrNames, &values) == noErr && values)
		{
			if (CFDictionaryGetValue(values, kLSItemIsInvisible) == boolean)
			{
				result = YES;
			}
			CFRelease(values);
		}
		CFRelease(attrNames);
	}
	return result;
}
- (BOOL)launchServiceItemIsInvisible
{
	return [self launchServiceItemIsInvisible:kCFBooleanTrue];
}
- (BOOL)launchServiceItemIsVisible
{
	return [self launchServiceItemIsInvisible:kCFBooleanFalse];
}

@end
