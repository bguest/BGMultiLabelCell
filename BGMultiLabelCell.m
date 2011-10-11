/** 
 * BGMultiLabelCell.m
 * Copyright (c) 2009, Benjamin Guest. 
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions are met:
 * 
 * -Redistributions of source code must retain the above copyright
 *  notice, this list of conditions and the following disclaimer.
 * -Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the 
 *  documentation and/or other materials provided with the distribution.
 * -Neither the name of Benjamin Guest nor the names of its 
 *  contributors may be used to endorse or promote products derived from 
 *  this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
 * POSSIBILITY OF SUCH DAMAGE. 
 */

#import "BGMultiLabelCell.h"


@implementation BGMultiLabelCell
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
