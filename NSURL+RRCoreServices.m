// $Id: NSURL+RRCoreServices.m,v 1.2 2008/10/30 18:10:31 royratcliffe Exp $
//
// Copyright © 2008, Roy Ratcliffe, Lancaster, United Kingdom
// All rights reserved
//
//------------------------------------------------------------------------------
//
// $Log: NSURL+RRCoreServices.m,v $
// Revision 1.2  2008/10/30 18:10:31  royratcliffe
// Wrapped long comment lines
//
// Revision 1.1  2008/07/11 14:52:29  royratcliffe
// URL extensions for Core Services, initial revision
//

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
