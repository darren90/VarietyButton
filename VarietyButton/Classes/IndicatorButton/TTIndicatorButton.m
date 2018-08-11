//
//  TTIndicatorButton.m
//  Expecta
//
//  Created by Fengtf on 2018/8/11.
//

#import "TTIndicatorButton.h"

@interface TTIndicatorButton ()

@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;

@property (nonatomic, copy) NSString *currentText;

@end

@implementation TTIndicatorButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if(self.activityIndicator) {
        self.activityIndicator.frame = self.bounds;
    }
}

- (void)setIndicatorType:(TTIndicatorButtonType)indicatorType {
    switch (indicatorType) {
        case TTIndicatorButtonNone:
            if (_activityIndicator) {
                _activityIndicator.hidden = YES;
                _activityIndicator = nil;
                [_activityIndicator removeFromSuperview];
            }
            break;
            
        case TTIndicatorButtonTranslucentAnimating:
            if (!_activityIndicator) {
                [self addIndicator];
                _activityIndicator.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
            }
            self.activityIndicator.hidden = NO;
            [self.activityIndicator startAnimating];
            break;
            
        case TTIndicatorButtonAnimating:
            if (!_activityIndicator) {
                [self addIndicator];
                _activityIndicator.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
            }
            self.activityIndicator.hidden = NO;
            [self.activityIndicator startAnimating];
            break;
            
        default:
            break;
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    self.currentText = title;
}

- (void)startAnimating {
    [self.activityIndicator startAnimating];

}

- (void)stopAnimating {
    [self.activityIndicator stopAnimating];
}

- (void)addIndicator{
    _activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    [self addSubview:_activityIndicator];
    _activityIndicator.hidesWhenStopped = NO;
    _activityIndicator.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
}

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    if (color) {
        [self setBackgroundImage:[self pixelImageWithColor:color] forState:state];
    }
}

- (UIImage *)pixelImageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions((CGSize){1.0f, 1.0f}, YES, 0.0f);
    
    [color setFill];
    
    [[UIBezierPath bezierPathWithRect:(CGRect){CGPointZero, {1.0f, 1.0f}}] fill];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [img resizableImageWithCapInsets:UIEdgeInsetsZero];
}


@end
