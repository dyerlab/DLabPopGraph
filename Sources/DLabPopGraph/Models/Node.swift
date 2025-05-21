//
//  Node.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import SwiftUI
import SceneKit
import Foundation
import CoreLocation

public class Node: Identifiable, Equatable, Hashable, CustomStringConvertible {
    
    public var id: UUID
    public var name: String
    public var size: Double
    public var color: Color
    
    public var coordinate: GeoCoordinate?
    public var position: LayoutCoordinate?
    
    public init(name: String, size: Double, color: Color = .red) {
        self.id = UUID()
        self.name = name
        self.size = size
        self.color = color
    }
    
    init(name: String, size: Double, color: Color, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.name = name
        self.size = size
        self.color = color
        
        let coord = GeoCoordinate(latitude: coordinate.latitude,
                                  longitude: coordinate.longitude )
        self.coordinate = coord
        
    }
    
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public var description: String {
        return "Node(\(name), \(size))"
    }
    
}

extension Node: MappableNode, LayoutNode {
    
    public var mapCoordinate: CLLocationCoordinate2D? {
        if let coord = coordinate {
            return coord.clLocation
        } else {
            return nil
        }
    }
    
    public var sceneCoordinate: SCNVector3? {
        if let pos = position {
            return pos.scnVector3
        } else {
            return nil
        }
    }
    
}

