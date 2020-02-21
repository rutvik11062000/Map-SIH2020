import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      // Add the following line, with your API key
  [GMSServices provideAPIKey: @"AIzaSyA6cteO_rciasQDNZaQK6oWe3FfO_giGwk"];
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
