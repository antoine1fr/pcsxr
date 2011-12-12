//
//  PcsxrFreezeStateHandler.m
//  Pcsxr
//
//  Created by Charles Betts on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PcsxrFreezeStateHandler.h"
#import "EmuThread.h"
#include "misc.h"

@implementation PcsxrFreezeStateHandler

- (BOOL)handleFile:(NSString *)theFile
{
	if (CheckState([theFile fileSystemRepresentation]) != 0) {
		return NO;
	}
	if ([EmuThread active]) {
		[EmuThread run];
	}
	[EmuThread defrostAt:theFile];
}

@end
