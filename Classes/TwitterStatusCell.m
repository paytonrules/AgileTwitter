#import "TwitterStatusCell.h"

@implementation TwitterStatusCell
@synthesize username, tweet;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) 
	{
		// Initialization code
  }
  return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
	[super setSelected:selected animated:animated];
}


- (void)dealloc {
	[username release];
	[tweet release];
	[super dealloc];
}


@end
