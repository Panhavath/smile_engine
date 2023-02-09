import 'package:flutter_test/flutter_test.dart';
import 'package:smile_engine/smile_engine.dart';
import 'package:smile_engine/smile_engine_platform_interface.dart';
import 'package:smile_engine/smile_engine_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSmileEnginePlatform
    with MockPlatformInterfaceMixin
    implements SmileEnginePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SmileEnginePlatform initialPlatform = SmileEnginePlatform.instance;

  test('$MethodChannelSmileEngine is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSmileEngine>());
  });

  test('getPlatformVersion', () async {
    SmileEngine smileEnginePlugin = SmileEngine();
    MockSmileEnginePlatform fakePlatform = MockSmileEnginePlatform();
    SmileEnginePlatform.instance = fakePlatform;

    expect(await smileEnginePlugin.getPlatformVersion(), '42');
  });
}
