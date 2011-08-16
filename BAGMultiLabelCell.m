//
//  MultiLabelCell.m
//  iRef-Kickball
//
//  Created by Benjamin Guest on 9/24/09.
//  Copyright 2009 Table 14 Software. All rights reserved.
//

#import "BAGMultiLabelCell.h"


@implementation BAGMultiLabelCell
@dynamic font;

-(UIFont*)font{
	UILabel* aLabel = [labels objectAtIndex:0];
	return aLabel.font;
}

-(void)setFont:(UIFont*)aFont{
	for(UILabel* aLabel in labels)
		aLabel.font = aFont;
}

-(id)initWithStyle:(UITableViewCellStyle)style
   reuseIdentifier:(NSString*)reuseIdentifier
	numberOfLabels:(NSInteger)number
{
	self = [super initWithStyle:(UITableViewCellStyle)style
				reuseIdentifier:(NSString*)reuseIdentifier];
	if (self) {
		//Calculate Cell Width
		CGSize size = self.bounds.size;
		NSInteger padOut = 12;
		NSInteger padIn = 2;
		NSInteger cellWidth = (size.width-2*padOut-(number-1)*padIn)/number;
		NSInteger X;
		
		NSMutableArray* theLabels = [NSMutableArray arrayWithCapacity:number];
		
		UILabel* aLabel;
		//UIView* aView;
		
		for (int i=0; i<number; i++) {
			X = padOut + (padIn+cellWidth)*i;
		//	aView = [[UIView alloc] initWithFrame:CGRectMake(X, 1, cellWidth, size.height-3)];
		//	aView.backgroundColor = [UIColor redColor];
		//	aView.alpha = .5;
			
			aLabel = [[UILabel alloc] initWithFrame:CGRectMake(X, 1, cellWidth, size.height-3)];

		//	aView.autoresizingMask = 
		//	UIViewAutoresizingFlexibleWidth+
		//	UIViewAutoresizingFlexibleRightMargin+
		//	UIViewAutoresizingFlexibleLeftMargin;
			
			aLabel.autoresizingMask=
			UIViewAutoresizingFlexibleWidth+
			UIViewAutoresizingFlexibleRightMargin+
			UIViewAutoresizingFlexibleLeftMargin;

			aLabel.textAlignment = UITextAlignmentCenter;
			aLabel.backgroundColor = [UIColor clearColor];
		//	aLabel.text = @"Test";
			[theLabels addObject:aLabel];     //Add To Labels Array
		//	[self.contentView addSubview:aView];
			[self.contentView addSubview:aLabel];

			[aLabel release];
		}
		labels = [[NSArray alloc] initWithArray:theLabels];
	}
	return self;
}

-(UILabel*)labelAtIndex:(NSInteger)anIndex{
	return [labels objectAtIndex:anIndex];
}

-(void)dealloc{
	[labels release];
	[super dealloc];
}
@end
