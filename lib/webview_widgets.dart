import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;
import 'webview_widgets_platform_interface.dart';

class WebviewWidgets {
  Future<String?> getPlatformVersion() {
    return WebviewWidgetsPlatform.instance.getPlatformVersion();
  }

  static Widget webViewPlatformWebsite(
      {required String webviewId,
      required String type,
      required String url,
      required double width,
      required double height}) {
    html.IFrameElement iframeElement = html.IFrameElement()
      ..src = url
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..onLoad.listen((event) {});
    String webviewRegisterKey = "$type:$webviewId";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      webviewRegisterKey,
      (int viewId) => iframeElement,
    );

    var child = HtmlElementView(viewType: webviewRegisterKey); //unique key

    return SizedBox(width: width, height: height, child: child);
  }

  static Widget webImagePlatformWebsite(
      {required String webviewId,
      required String url,
      double width = double.infinity,
      double height = double.infinity}) {
    html.ImageElement imageElement = html.ImageElement()
      ..src = url
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'contain'
      ..onLoad.listen((event) {});

    String webviewRegisterKey = "Image:$webviewId";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      webviewRegisterKey,
      (int viewId) => imageElement,
    );

    var child = HtmlElementView(viewType: webviewRegisterKey); //unique key

    return SizedBox(width: width, height: height, child: child);
  }
}
