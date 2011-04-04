//
//  ChatRoomViewController.h
//  iCometChat
//
//  Created by Yongseok Kang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChatRoom;
@interface ChatRoomViewController : UITableViewController {
    ChatRoom *room;
}
@property (nonatomic, retain)ChatRoom *room;
@end
