
import 'newcontact_platform_interface.dart';

class Newcontact {
  Future<String?> getPlatformVersion() {
    return NewcontactPlatform.instance.getPlatformVersion();
  }
}
