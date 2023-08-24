import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'fake_http_client_request.dart';

class FakeHttpClient extends Fake implements HttpClient {
  FakeHttpClient([this.context]);

  SecurityContext? context;

  @override
  bool autoUncompress = false;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    return FakeHttpClientRequest(isSvg: url.path.endsWith(".svg"));
  }

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) async {
    return FakeHttpClientRequest(isSvg: url.path.endsWith(".svg"));
  }
}
