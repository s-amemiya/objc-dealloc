
#import <Foundation/Foundation.h>

@interface Composited : NSObject
@end

@implementation Composited
- (void)dealloc { NSLog(@"Composited's dealloc."); }
@end

@interface ObjC : NSObject {
	Composited *composited_;
}
@end

@implementation ObjC

- (id)init
{
    self = [super init];
    if (self) {
        composited_ = [[Composited alloc] init];
    }
    return self;
}

- (void)dealloc
{
	NSLog(@"ObjC's dealloc.");
}

@end

static void test()
{
	ObjC *objc = [[ObjC alloc] init];
}

int main()
{
	test();
	return 0;
}