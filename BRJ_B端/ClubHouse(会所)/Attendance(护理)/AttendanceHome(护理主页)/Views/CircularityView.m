//
//  CircularityView.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/18.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "CircularityView.h"


@interface CircularityView()

@property (nonatomic,strong) UIBezierPath *path;

@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@property (nonatomic,strong) CAShapeLayer *bgLayer;

@end


@implementation CircularityView


- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        
        self.bgLayer = [CAShapeLayer layer];
        self.bgLayer.frame = self.bounds;
        self.bgLayer.fillColor = [UIColor clearColor].CGColor;
        self.bgLayer.lineWidth = 7.0f;
        self.bgLayer.strokeColor = [UIColor colorWithHexString:@"#9AC3ED"].CGColor;
        self.bgLayer.strokeStart = 0.f;
        self.bgLayer.strokeEnd = 2.f;
        self.bgLayer.path = self.path.CGPath;
        
        [self.layer addSublayer:self.bgLayer];
        
        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.frame = self.bounds;
        self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
        self.shapeLayer.lineWidth = 7.f;
        self.shapeLayer.lineCap = kCALineCapRound;
        self.shapeLayer.strokeColor = [UIColor colorWithHexString:@"#F0867B"].CGColor;
        self.shapeLayer.strokeStart = 0.f;
        self.shapeLayer.strokeEnd = 0.f;
        self.shapeLayer.path = self.path.CGPath;
        
        [self.layer addSublayer:self.shapeLayer];
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformRotate(transform, -M_PI / 2);
        
    }
    return self;
}


@synthesize value = _value;

- (void)setValue:(CGFloat)value
{
    _value = value;
    self.shapeLayer.strokeEnd = value;
}

- (CGFloat)value{
    return _value;
}

@synthesize lineColr = _lineColr;

- (void)setLineColr:(UIColor *)lineColr
{
    _lineColr = lineColr;
    self.shapeLayer.strokeColor = lineColr.CGColor;
}

- (UIColor *)lineColr{
    return _lineColr;
}

@synthesize lineWidth = _lineWidth;

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    self.shapeLayer.lineWidth = lineWidth;
    self.bgLayer.lineWidth = lineWidth;
}

- (CGFloat)lineWidth{
    return _lineWidth;
}


@end
