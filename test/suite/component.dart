import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'fake/fake_http_client.dart';
import 'util/window.dart';

typedef OnSetupTestComponent = Future<void> Function();

typedef OnCreateTestComponent<T> = T Function(BuildContext context);

typedef OnRunTestComponent = Future<void> Function(WidgetTester tester);
typedef CallableComponent = Widget Function();

@isTest
void testComponent(
  String description, {
  bool skip = false,
  required Widget component,
  OnSetupTestComponent? onSetupTest,
  required OnRunTestComponent onRunTest,
}) {
  _testBaseComponent(
    description,
    skip: skip,
    onSetupTest: onSetupTest,
    onCreateComponent: () {
      return Builder(
        builder: (_) {
          return MediaQuery(
            data: const MediaQueryData(),
            child: _createMaterialApp(
              component: component,
            ),
          );
        },
      );
    },
    onRunTest: onRunTest,
  );
}

@isTest
void testCallableBlocComponent<T extends StateStreamableSource<Object?>>(
  String description, {
  bool skip = false,
  required CallableComponent callableComponent,
  OnSetupTestComponent? onSetupTest,
  required OnCreateTestComponent<T> onCreateTest,
  required OnRunTestComponent onRunTest,
}) async {
  _testBaseComponent(
    description,
    skip: skip,
    onSetupTest: onSetupTest,
    onCreateComponent: () {
      return _createMaterialApp(
        component: Provider<T>(
          create: onCreateTest,
          builder: (context, child) {
            return callableComponent();
          },
        ),
      );
    },
    onRunTest: onRunTest,
  );
}

@isTest
void testBlocComponent<T extends StateStreamableSource<Object?>>(
  String description, {
  bool skip = false,
  required Widget component,
  OnSetupTestComponent? onSetupTest,
  required OnCreateTestComponent<T> onCreateTest,
  required OnRunTestComponent onRunTest,
}) async {
  _testBaseComponent(
    description,
    skip: skip,
    onSetupTest: onSetupTest,
    onCreateComponent: () {
      return _createMaterialApp(
        component: Provider<T>(
          create: onCreateTest,
          builder: (context, child) {
            return component;
          },
        ),
      );
    },
    onRunTest: onRunTest,
  );
}

@isTest
void testMultiBlocsComponent(
  String description, {
  bool skip = false,
  required Widget component,
  required List<SingleChildWidget> providers,
  OnSetupTestComponent? onSetupTest,
  required OnCreateTestComponent onCreateTest,
  required OnRunTestComponent onRunTest,
}) async {
  _testBaseComponent(
    description,
    skip: skip,
    onSetupTest: onSetupTest,
    onCreateComponent: () {
      return _createMaterialApp(
        component: MultiProvider(
          providers: providers,
          child: component,
          builder: (context, child) {
            onCreateTest(context);
            return component;
          },
        ),
      );
    },
    onRunTest: onRunTest,
  );
}

@isTest
void _testBaseComponent(
  String description, {
  bool skip = false,
  OnSetupTestComponent? onSetupTest,
  required Function() onCreateComponent,
  required OnRunTestComponent onRunTest,
}) {
  testWidgets(
    description,
    (tester) async {
      initializeWindowSize(tester);

      if (onSetupTest != null) await onSetupTest();

      await HttpOverrides.runZoned(
        () async {
          await tester.pumpWidget(
            onCreateComponent(),
          );

          await onRunTest(tester);
        },
        createHttpClient: (_) => FakeHttpClient(),
      );
    },
    skip: skip,
  );
}

Widget _createMaterialApp({
  required Widget component,
}) {
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  return MaterialApp(
    home: Scaffold(body: component),
    scaffoldMessengerKey: scaffoldMessengerKey,
    debugShowCheckedModeBanner: false,
  );
}
