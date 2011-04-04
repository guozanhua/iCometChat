//
//  ChatRoom.m
//  iCometChat
//
//  Created by Yongseok Kang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChatRoom.h"
#import "ChatPort.h"


@implementation ChatRoom
@synthesize port, messages;

+ (ChatRoom *)room {
    return [[[ChatRoom alloc] init] autorelease];
}

- (id)init {
    self = [super init];
    if (self) {
        self.port = [ChatPort port];
        self.messages = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    Block_release(notifyUpdated);
    [port release];
    [messages release];
    [super dealloc];
}

- (void)bind:(void (^)(void))aNotifyUpdated {
    notifyUpdated = Block_copy(aNotifyUpdated);
    [port bindServerNotification:^(NSString *message) {
        [messages addObject:message];
        notifyUpdated();
    }];
}

- (NSInteger)countMessages {
    return [messages count];
}

- (NSIndexPath *)indexPathAtLast {
    NSInteger row = [self countMessages] - 1;
    return [NSIndexPath indexPathForRow:row inSection:0]; 
}

- (NSString *)message:(NSInteger)row {
    return [messages objectAtIndex:row];
}
@end
