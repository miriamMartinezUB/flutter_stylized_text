#import "FlutterStylizedTextPlugin.h"
#if __has_include(<flutter_stylized_text/flutter_stylized_text-Swift.h>)
#import <flutter_stylized_text/flutter_stylized_text-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_stylized_text-Swift.h"
#endif

@implementation FlutterStylizedTextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterStylizedTextPlugin registerWithRegistrar:registrar];
}
@end
