import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'smile_engine_method_channel.dart';

abstract class SmileEnginePlatform extends PlatformInterface {
  /// Constructs a SmileEnginePlatform.
  SmileEnginePlatform() : super(token: _token);

  static final Object _token = Object();

  static SmileEnginePlatform _instance = MethodChannelSmileEngine();

  /// The default instance of [SmileEnginePlatform] to use.
  ///
  /// Defaults to [MethodChannelSmileEngine].
  static SmileEnginePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SmileEnginePlatform] when
  /// they register themselves.
  static set instance(SmileEnginePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
