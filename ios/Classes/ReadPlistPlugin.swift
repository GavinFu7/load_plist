import Flutter
import UIKit

public class ReadPlistPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "read_plist", binaryMessenger: registrar.messenger())
    let instance = ReadPlistPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "readPlist":
        if let sourcePath = call.arguments as? String {
          if let dictionary = NSDictionary(contentsOfFile: sourcePath) {
            result(dictionary)
            return
          }
        }

        result(nil)
      default:
        result(FlutterMethodNotImplemented)
    }
  }
}
