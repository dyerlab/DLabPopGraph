//
//  GeoCoordinate.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation
import CoreLocation


public protocol MappableNode {
    var mapCoordinate: CLLocationCoordinate2D? { get }
}


public struct GeoCoordinate: CustomStringConvertible {
    public var latitude: Double
    public var longitude: Double
    
    public var clLocation: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public var description: String {
        return "(lat: \(latitude), lon: \(longitude))"
    }
    
}
