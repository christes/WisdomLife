//
//  UIImageView+Addition.m
//  NeiHan
//
//  Created by Charles on 16/9/7.
//  Copyright © 2016年 Com.Charles. All rights reserved.
//

#import "UIImageView+Addition.h"
#import <ImageIO/ImageIO.h>
#import <objc/runtime.h>

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;


#if __has_feature(objc_arc)
#define toCF (__bridge CFTypeRef)
#define ARCCompatibleAutorelease(object) object
#else
#define toCF (CFTypeRef)
#define ARCCompatibleAutorelease(object) [object autorelease]
#endif

@implementation UIImageView (Addition)

- (instancetype)initWithTarget:(id)target
                        action:(SEL)action {
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action {
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
}

+ (UIImageView *)imageViewWithAnimatedGIFImageSource:(CGImageSourceRef) source
                                         andDuration:(NSTimeInterval) duration {
    if (!source) return nil;
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:count];
    for (size_t i = 0; i < count; ++i) {
        CGImageRef cgImage = CGImageSourceCreateImageAtIndex(source, i, NULL);
        if (!cgImage)
            return nil;
        [images addObject:[UIImage imageWithCGImage:cgImage]];
        CGImageRelease(cgImage);
    }
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setAnimationImages:images];
    [imageView setAnimationDuration:duration];
    [imageView sizeToFit];
    [imageView startAnimating];
    return ARCCompatibleAutorelease(imageView);
}

+ (NSTimeInterval)durationForGifData:(NSData *)data {
    char graphicControlExtensionStartBytes[] = {0x21,0xF9,0x04};
    double duration=0;
    NSRange dataSearchLeftRange = NSMakeRange(0, data.length);
    while(YES){
        NSRange frameDescriptorRange = [data rangeOfData:[NSData dataWithBytes:graphicControlExtensionStartBytes
                                                                        length:3]
                                                 options:NSDataSearchBackwards
                                                   range:dataSearchLeftRange];
        if(frameDescriptorRange.location != NSNotFound){
            NSData *durationData = [data subdataWithRange:NSMakeRange(frameDescriptorRange.location+4, 2)];
            unsigned char buffer[2];
            [durationData getBytes:buffer length:data.length];
            double delay = (buffer[0] | buffer[1] << 8);
            duration += delay;
            dataSearchLeftRange = NSMakeRange(0, frameDescriptorRange.location);
        }else{
            break;
        }
    }
    return duration/100;
}

+ (UIImageView *)imageViewWithGIFData:(NSData *)data {
    NSTimeInterval duration = [self durationForGifData:data];
    CGImageSourceRef source = CGImageSourceCreateWithData(toCF data, NULL);
    UIImageView *imageView = [UIImageView imageViewWithAnimatedGIFImageSource:source andDuration:duration];
    CFRelease(source);
    return imageView;
}

+ (UIImageView *)imageViewWithGIFURL:(NSURL *)url{
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [UIImageView imageViewWithGIFData:data];
}


- (void)bl_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)b_enlargedRect
{
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self b_enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}
@end
