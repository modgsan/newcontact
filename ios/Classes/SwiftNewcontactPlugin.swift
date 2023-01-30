import Flutter
import UIKit
import Contacts
import ContactsUI

public class SwiftNewcontactPlugin: NSObject, FlutterPlugin, CNContactViewControllerDelegate {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "newcontact", binaryMessenger: registrar.messenger())
    let instance = SwiftNewcontactPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  var resultBack:((Bool)->Void)?

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "newContact" {
        openNewContact(result:result)
    } else {
        result("iOS " + UIDevice.current.systemVersion)
    }
  }

    private func openNewContact(result: @escaping FlutterResult) {
        let newContact = CNMutableContact()
        let contactViewController = CNContactViewController(forNewContact: newContact)
        contactViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: contactViewController)
        UIApplication.shared.keyWindow?.rootViewController?.present(navigationController, animated: true, completion: nil)
        resultBack = { ret in
            result(ret)
        }
    }


  public func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
      viewController.dismiss(animated: true, completion: nil)
      UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
      if (contact != nil) {
        resultBack?(true)
      } else {
        resultBack?(false)
      }
  }
}
