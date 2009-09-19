// NSURL+RRCoreServices.m
//
// Copyright © 2008, 2009, Roy Ratcliffe, Lancaster, United Kingdom
// All rights reserved
//
//------------------------------------------------------------------------------

#import "NSURL+RRCoreServices.h"

@implementation NSURL(RRCoreServices)

- (BOOL)registerComponentFile:(NSInteger)global error:(NSError **)outError
{
	// Note that NSURL is “toll-free bridged” with its Core Foundation
	// counterpart, CFURL! Hence in an API where you see an NSURL * parameter,
	// you can pass a CFURLRef, and in an API where you see a CFURLRef
	// parameter, you can pass a pointer to an NSURL instance.
	FSRef fs;
	if (CFURLGetFSRef((CFURLRef)self, &fs))
	{
		OSErr err = RegisterComponentFileRef(&fs, global);
		if (err == noErr)
		{
			return YES;
		}
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:err userInfo:nil];
	}
	return NO;
}

@end
