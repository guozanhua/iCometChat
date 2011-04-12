//
//  ChatPort.m
//  iCometChat
//
//  Created by Yongseok Kang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChatPort.h"


@implementation ChatPort
static NSString *url = @"http://localhost:8080/serverMesssageNotifier?id=feelform@gmail.com&roomNumber=1&device=mobile";

+ (ChatPort *) port {
    return [[[ChatPort alloc] init] autorelease];
}

- (void)dealloc {
    Block_release(resultCallBack);
    [super dealloc];
}

- (void)bindServerNotification:(void (^)(NSString *message))aResultCallBack {
    resultCallBack = Block_copy(aResultCallBack);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    resultCallBack(message);
    [message release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
}
@end
