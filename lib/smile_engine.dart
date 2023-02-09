
import 'smile_engine_platform_interface.dart';
import 'dart:ffi';
// import "sm"
import 'dart:async';
import 'dart:io';

// ffi
typedef smile_predict = Double Function();
// dart
typedef smilepredict = Double Function();

// class SmileEngine {
//   Future<String?> getPlatformVersion() {
//     return SmileEnginePlatform.instance.getPlatformVersion();
//   }
// }
typedef NativeFunction = Double Function();
class SmileEngine {
    // final smile_lib = DynamicLibrary.open('smile_engine.so');
    // // smilepredict smileprediction = smile_lib.lookup<NativeFunction<smile_predict>>('get_prediction_result').asFunction();


    //   // final dylib = DynamicLibrary.open('libexample.so');
    // final add = smile_lib.lookup<NativeFunction>('get_prediction_result');

    // final result = add();
static const _package_name = 'smile_engine';

static DynamicLibrary? _getDynamicLibrary() {
    DynamicLibrary dynamicLibrary;
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      try {
        //running flutter test in cli (tested in windows only)
        dynamicLibrary = DynamicLibrary.open(
            '${_findSmileCppDirectory('SMILE_CPP').path}/x64/Debug/SMILEEngineDengue');
      } on FileSystemException catch (e) {
        print(e);
        return null;
      }
    } else {
      dynamicLibrary = Platform.isAndroid
          ? DynamicLibrary.open("lib$_package_name.so") //Android
          : DynamicLibrary.open("smile_engine.framework/$_package_name");
    }

    return dynamicLibrary;
  }
static Directory _findSmileCppDirectory(String smileCppFolderName) {
    var d = Directory.current;
    var s = d.path + '/' + smileCppFolderName;
    while (!Directory(s).existsSync()) {
      d = d.parent;
      s = d.path + '/' + smileCppFolderName;
      if (d.parent.path == d.path) {
        throw FileSystemException('Directory could not be found');
      }
    }
    return Directory(s);
  }
}