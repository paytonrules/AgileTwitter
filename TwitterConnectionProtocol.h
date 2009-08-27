@protocol TwitterConnectionProtocol
	-(void) tweet:(NSString*) message;
	-(void) refresh;
	@property(nonatomic, retain) NSObject *delegate;
@end