@protocol TwitterConnectionProtocol
	-(void) tweet:(NSString*) message;
	-(void) refresh;
@end