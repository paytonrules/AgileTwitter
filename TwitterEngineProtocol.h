@protocol TwitterEngineProtocol
	- (NSString *)username;
	- (NSString *)password;
	- (NSString *)getFollowedTimelineFor:(NSString *)username since:(NSDate *)date startingAtPage:(int)pageNum;
	- (void)setUsername:(NSString *)username password:(NSString *)password;
	- (NSString *)sendUpdate:(NSString *)status;
@end