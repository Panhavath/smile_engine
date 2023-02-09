import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'smile_engine_platform_interface.dart';

/// An implementation of [SmileEnginePlatform] that uses method channels.
class MethodChannelSmileEngine extends SmileEnginePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('smile_engine');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
