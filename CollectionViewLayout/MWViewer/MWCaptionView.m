//
//  MWCaptionView.m
//  MWPhotoBrowser
//
//  Created by Michael Waterfall on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MWCommon.h"
#import "MWCaptionView.h"
#import "MWPhoto.h"

static const CGFloat labelPadding = 10;

// Private
@interface MWCaptionView () {
    id <MWPhoto> _photo;
    UILabel *_label;
    UILabel *_titleLab;
    UITextView *_contentView;
    UILabel *_indexLab;
}
@end

@implementation MWCaptionView

- (id)initWithPhoto:(id<MWPhoto>)photo {
    self = [super initWithFrame:CGRectMake(0, 0, 320, 44)]; // Random initial frame
    if (self) {
        self.userInteractionEnabled = NO;
        _photo = photo;
        self.barStyle = UIBarStyleBlackTranslucent;
        self.userInteractionEnabled = YES;
        self.tintColor = nil;
        self.barTintColor = nil;
        self.barStyle = UIBarStyleBlackTranslucent;
        [self setBackgroundImage:nil forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [self setupCaption];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat maxHeight = 9999;
    if (_label.numberOfLines > 0) maxHeight = _label.font.leading*_label.numberOfLines;
    CGSize textSize = [_label.text boundingRectWithSize:CGSizeMake(size.width - labelPadding*2, maxHeight)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:_label.font}
                                                context:nil].size;
    CGFloat maxH = (textSize.height + labelPadding * 2)>[UIScreen mainScreen].bounds.size.height * 0.33 ? [UIScreen mainScreen].bounds.size.height * 0.33 : (textSize.height + labelPadding * 2);
    CGFloat scrH = [UIScreen mainScreen].bounds.size.height * 0.25;
    return CGSizeMake(size.width, scrH);
}

- (void)setupCaption {
    
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(labelPadding, 0,
                                                          self.bounds.size.width-labelPadding*2 - 60,
                                                          20)];
//    _titleLab.text = @"hihihsihsidhi";
    _titleLab.textColor = [UIColor whiteColor];
    
    if ([_photo respondsToSelector:@selector(caption)]) {
        _titleLab.text = [_photo title] ? [_photo title] : @" ";
    }
    [self addSubview:_titleLab];

    _indexLab = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - labelPadding, 0,
                                                          self.bounds.size.width-labelPadding*2 - _titleLab.bounds.size.width,
                                                          20)];
    if ([_photo respondsToSelector:@selector(caption)]) {
        _indexLab.text = [_photo index] ? [_photo index] : @" ";
    }
    _indexLab.textColor = [UIColor whiteColor];
    [self addSubview:_indexLab];
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(labelPadding, _titleLab.bounds.size.height+labelPadding,
                                                       self.bounds.size.width-labelPadding*2,
                                                       self.bounds.size.height -20))];
    _label.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _label.opaque = NO;
    _label.backgroundColor = [UIColor clearColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.lineBreakMode = NSLineBreakByWordWrapping;

    _label.numberOfLines = 0;
    _label.textColor = [UIColor whiteColor];
    _label.font = [UIFont systemFontOfSize:17];
    if ([_photo respondsToSelector:@selector(caption)]) {
        _label.text = [_photo caption] ? [_photo caption] : @" ";
    }
//    [self addSubview:_label];
    
    
    _contentView = [[UITextView alloc] initWithFrame:CGRectIntegral(CGRectMake(labelPadding, _titleLab.bounds.size.height+labelPadding,
                                                                               self.bounds.size.width-labelPadding*2,
                                                                               self.bounds.size.height -20))];
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _contentView.opaque = NO;
    _contentView.editable = NO;
    _contentView.selectable = NO;
    _contentView.backgroundColor = [UIColor clearColor];
    _contentView.textColor = [UIColor whiteColor];
    _contentView.textAlignment = NSTextAlignmentLeft;
    _contentView.font = [UIFont systemFontOfSize:17];
    if ([_photo respondsToSelector:@selector(caption)]) {
        _contentView.text = [_photo caption] ? [_photo caption] : @" ";
    }
    [self addSubview:_contentView];
}


@end
