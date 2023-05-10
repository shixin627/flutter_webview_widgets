import 'package:flutter_test/flutter_test.dart';
import 'package:webview_widgets/webview_widgets.dart';
import 'package:webview_widgets/webview_widgets_platform_interface.dart';
import 'package:webview_widgets/webview_widgets_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWebviewWidgetsPlatform
    with MockPlatformInterfaceMixin
    implements WebviewWidgetsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WebviewWidgetsPlatform initialPlatform = WebviewWidgetsPlatform.instance;

  test('$MethodChannelWebviewWidgets is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWebviewWidgets>());
  });

  test('getPlatformVersion', () async {
    WebviewWidgets webviewWidgetsPlugin = WebviewWidgets();
    MockWebviewWidgetsPlatform fakePlatform = MockWebviewWidgetsPlatform();
    WebviewWidgetsPlatform.instance = fakePlatform;

    expect(await webviewWidgetsPlugin.getPlatformVersion(), '42');
  });
}
