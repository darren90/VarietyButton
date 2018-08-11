//
//  TTIndicatorButton.h
//  Expecta
//
//  Created by Fengtf on 2018/8/11.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TTIndicatorButtonType) {
    TTIndicatorButtonNone,          //Default 无菊花
    TTIndicatorButtonTranslucentAnimating, //半透明 菊花
    TTIndicatorButtonAnimating,     //不透明菊花
};

@interface TTIndicatorButton : UIButton

@property (nonatomic, assign) TTIndicatorButtonType indicatorType;

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
