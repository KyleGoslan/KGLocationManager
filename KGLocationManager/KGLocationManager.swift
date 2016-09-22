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

public class KGLocationManager: NSObject, CLLocationManagerDelegate {
  
  public static let sharedManager = KGLocationManager()
  private var locationManager = CLLocationManager()
  
  public var currentLocation: CLLocation?
  public var delegate: KGLocationUpdateDelegte?
  public var firstUpdate = true
  
  private override init () {
    super.init()
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let newLocation = locations.last else { return }
    currentLocation = newLocation
    delegate?.didUpdate(location: newLocation)
    if firstUpdate {
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FirstLocationUpdate"), object: self)
      delegate?.gotFirst(location: newLocation)
      firstUpdate = !firstUpdate
    }

  }

  
}
