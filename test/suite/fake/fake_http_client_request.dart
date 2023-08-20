import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'fake_http_client_response.dart';

class FakeHttpClientRequest extends Fake implements HttpClientRequest {
  final bool isSvg;

  FakeHttpClientRequest({
    required this.isSvg,
  });

  @override
  Future<HttpClientResponse> close() async {
    return FakeHttpClientResponse(isSvg: isSvg);
  }
}
