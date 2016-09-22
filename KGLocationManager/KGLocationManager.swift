//
//  KGLocationManager.swift
//  KGLocationManager
//
//  Created by Kyle Goslan on 21/09/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//

import Foundation
import CoreLocation

protocol KGLocationUpdateProtocol {
  func didUpdate(location : CLLocation)
}

class KGLocationManager: NSObject, CLLocationManagerDelegate {
  
  static let sharedManager = KGLocationManager()
  private var locationManager = CLLocationManager()
  
  var currentLocation: CLLocation?
  var delegate: KGLocationUpdateProtocol?
  var firstUpdate = true
  
  private override init () {
    super.init()
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  private func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
    currentLocation = newLocation
    delegate?.didUpdate(location: newLocation)
    if firstUpdate {
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FirstLocationUpdate"), object: self)
      firstUpdate = !firstUpdate
    }
  }
  
}
