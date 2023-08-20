import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

final kTransparentImage = base64Decode(
// ignore: lines_longer_than_80_chars
  "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
);

//one pixel in svg format
final kSvgImage = base64Decode(
  "PHN2ZyBoZWlnaHQ9IjEiIHdpZHRoPSIxIj48L3N2Zz4=",
);

class FakeHttpClientResponse extends Fake implements HttpClientResponse {
  final bool isSvg;

  FakeHttpClientResponse({
    required this.isSvg,
  });

  @override
  int get statusCode => 200;

  @override
  int get contentLength => isSvg ? kSvgImage.length : kTransparentImage.length;

  @override
  final FakeHttpHeaders headers = FakeHttpHeaders();

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int>)? onData, {
    void Function()? onDone,
    Function? onError,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.fromIterable(
            <List<int>>[isSvg ? kSvgImage : kTransparentImage])
        .listen(onData,
            onDone: onDone, onError: onError, cancelOnError: cancelOnError);
  }
}

class FakeHttpHeaders extends Fake implements HttpHeaders {}
