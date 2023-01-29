import 'package:flutter_test/flutter_test.dart';
import 'package:newcontact/newcontact.dart';
import 'package:newcontact/newcontact_platform_interface.dart';
import 'package:newcontact/newcontact_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNewcontactPlatform
    with MockPlatformInterfaceMixin
    implements NewcontactPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NewcontactPlatform initialPlatform = NewcontactPlatform.instance;

  test('$MethodChannelNewcontact is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNewcontact>());
  });

  test('getPlatformVersion', () async {
    Newcontact newcontactPlugin = Newcontact();
    MockNewcontactPlatform fakePlatform = MockNewcontactPlatform();
    NewcontactPlatform.instance = fakePlatform;

    expect(await newcontactPlugin.getPlatformVersion(), '42');
  });
}
