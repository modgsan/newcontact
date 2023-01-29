import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'newcontact_method_channel.dart';

abstract class NewcontactPlatform extends PlatformInterface {
  /// Constructs a NewcontactPlatform.
  NewcontactPlatform() : super(token: _token);

  static final Object _token = Object();

  static NewcontactPlatform _instance = MethodChannelNewcontact();

  /// The default instance of [NewcontactPlatform] to use.
  ///
  /// Defaults to [MethodChannelNewcontact].
  static NewcontactPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NewcontactPlatform] when
  /// they register themselves.
  static set instance(NewcontactPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
