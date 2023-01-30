import Flutter
import UIKit
import Contacts
import ContactsUI

public class SwiftNewcontactPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "newcontact", binaryMessenger: registrar.messenger())
    let instance = SwiftNewcontactPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "newContact" {
        let newContact = CNMutableContact()
        let contactViewController = CNContactViewController(forNewContact: newContact)
        let navigationController = UINavigationController(rootViewController: contactViewController)
        UIApplication.shared.keyWindow?.rootViewController?.present(navigationController, animated: true, completion: nil)
    } else {
        result("iOS " + UIDevice.current.systemVersion)
    }
  }
}
