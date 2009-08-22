#import <UIKit/UIKit.h>

@interface TwitterStatusCell : UITableViewCell 
{
	IBOutlet UILabel *username;
	IBOutlet UILabel *tweet;
}

@property(nonatomic, retain) UILabel *username;
@property(nonatomic, retain) UILabel *tweet;

@end
