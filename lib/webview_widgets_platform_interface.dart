import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webview_widgets_method_channel.dart';

abstract class WebviewWidgetsPlatform extends PlatformInterface {
  /// Constructs a WebviewWidgetsPlatform.
  WebviewWidgetsPlatform() : super(token: _token);

  static final Object _token = Object();

  static WebviewWidgetsPlatform _instance = MethodChannelWebviewWidgets();

  /// The default instance of [WebviewWidgetsPlatform] to use.
  ///
  /// Defaults to [MethodChannelWebviewWidgets].
  static WebviewWidgetsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WebviewWidgetsPlatform] when
  /// they register themselves.
  static set instance(WebviewWidgetsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
