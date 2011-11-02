
#import <Foundation/Foundation.h>

@class MyClass;
@interface Composited : NSObject {
	__weak MyClass *myClass_;
}
- (id)initWithMyClass:(MyClass *)myClass;
- (void)func;
@end

@interface MyClass : NSObject {
	Composited *composited_;
}
- (void)func;
@end

@implementation Composited

- (id)initWithMyClass:(MyClass *)myClass
{
	NSLog(@"%s", __func__);
	self = [super init];
	if (self) {
		myClass_ = myClass;
	}
	return self;
}

- (void)dealloc { NSLog(@"%s", __func__); }

- (void)func
{
	NSLog(@"%s", __func__);
	[myClass_ func];
}

@end

@implementation MyClass

- (id)init
{
	NSLog(@"%s", __func__);
    self = [super init];
    if (self) {
        composited_ = [[Composited alloc] initWithMyClass:self];
    }
    return self;
}

- (void)dealloc
{
	NSLog(@"%s", __func__);
	[composited_ func];
}

- (void)func { NSLog(@"%s", __func__); }

@end

static void test()
{
	MyClass *mc = [[MyClass alloc] init];
}

int main()
{
	test();
	return 0;
}