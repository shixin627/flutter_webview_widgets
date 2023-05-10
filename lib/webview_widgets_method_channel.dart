import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'webview_widgets_platform_interface.dart';

/// An implementation of [WebviewWidgetsPlatform] that uses method channels.
class MethodChannelWebviewWidgets extends WebviewWidgetsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('webview_widgets');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
