//
//  ChatRoom.h
//  iCometChat
//
//  Created by Yongseok Kang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChatPort;
@interface ChatRoom : NSObject {
    ChatPort *port;
    NSMutableArray *messages;
    void (^notifyUpdated)(void);
}
@property (nonatomic, retain)ChatPort *port;
@property (nonatomic, retain)NSMutableArray *messages;

+ (ChatRoom *)room;
- (void)bind:(void (^)(void))notifyUpdated;
- (NSInteger)countMessages;
- (NSIndexPath *)indexPathAtLast;
- (NSString *)message:(NSInteger)row;
@end
