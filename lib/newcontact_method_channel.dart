import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'newcontact_platform_interface.dart';

/// An implementation of [NewcontactPlatform] that uses method channels.
class MethodChannelNewcontact extends NewcontactPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('newcontact');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> newContact() async {
    final ret = await methodChannel.invokeMethod<bool>('newContact');
    return ret??false;
  }
}
