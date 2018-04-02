import UIKit

extension Notification.Name {
  static let FirstLocationUpdate = Notification.Name("FirstLocationUpdate")
  static let DidUpdateLocation = Notification.Name("DidUpdateLocation")
}

extension Notification.Name {
  func post(object:Any? = nil, userInfo:[AnyHashable: Any]? = nil) {
    NotificationCenter.default.post(name: self, object: object, userInfo: userInfo)
  }
}
