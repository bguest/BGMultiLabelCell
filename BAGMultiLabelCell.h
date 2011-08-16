//
//  TripleCell.h
//  iRef-Kickball
//
//  Created by Benjamin Guest on 9/24/09.
//  Copyright 2009 Table 14 Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BAGMultiLabelCell : UITableViewCell {
	NSArray* labels;
}
@property(nonatomic, retain) UIFont *font;

-(id)initWithStyle:(UITableViewCellStyle)style
   reuseIdentifier:(NSString*)reuseIdentifier
	 numberOfLabels:(NSInteger)number;

-(UILabel*)labelAtIndex:(NSInteger)index;

@end
