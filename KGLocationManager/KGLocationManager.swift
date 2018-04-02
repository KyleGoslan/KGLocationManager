//
//  KGLocationManager.swift
//  KGLocationManager
//
//  Created by Kyle Goslan on 21/09/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//

import Foundation
import CoreLocation

public protocol KGLocationUpdateDelegte {
  func didUpdate(location: CLLocation)
  func gotFirst(location: CLLocation)
}

open class KGLocationManager: NSObject {
  
  public static let shared = KGLocationManager()
  private var locationManager = CLLocationManager()
  
  public var currentLocation: CLLocation?
  public var delegate: KGLocationUpdateDelegte?
  public var isFirstUpdate = true
  
  public func configure(startUpdatingLocation: Bool = true) {
    if startUpdatingLocation { locationManager.startUpdatingLocation() }
  }
  
  private override init () {
    super.init()
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
  }
  
}


extension KGLocationManager: CLLocationManagerDelegate {
  
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let newLocation = locations.last else { return }
    currentLocation = newLocation
    delegate?.didUpdate(location: newLocation)
    Notification.Name.DidUpdateLocation.post(object: self, userInfo: nil)
    if isFirstUpdate {
      Notification.Name.FirstLocationUpdate.post(object: self, userInfo: nil)
      delegate?.gotFirst(location: newLocation)
      isFirstUpdate = !isFirstUpdate
    }
    
  }
  
}

