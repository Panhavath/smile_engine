import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_engine/smile_engine_method_channel.dart';

void main() {
  MethodChannelSmileEngine platform = MethodChannelSmileEngine();
  const MethodChannel channel = MethodChannel('smile_engine');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
