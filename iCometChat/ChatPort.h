//
//  ChatPort.h
//  iCometChat
//
//  Created by Yongseok Kang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChatPort : NSObject {
    void (^resultCallBack)(NSString *message);
}
+ (ChatPort *) port;
- (void)bindServerNotification:(void (^)(NSString *message))resultCallBack;
@end
