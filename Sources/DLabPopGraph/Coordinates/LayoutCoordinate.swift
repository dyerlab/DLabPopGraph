//
//  LayoutCoordinate.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation
import SceneKit


public protocol LayoutNode {
    var sceneCoordinate: SCNVector3? { get }
}

public struct LayoutCoordinate: CustomStringConvertible {

    public var x: CGFloat
    public var y: CGFloat
    public var z: CGFloat
    
    public var scnVector3: SCNVector3 {
        #if os(macOS)
        return SCNVector3(x: x, y: y, z: z )
        #elseif os(iOS)
        return SCNVector3(x: Float(x), y: Float(y), z: Float(z) )
        #endif
    }
    
    public init(x: Double, y: Double, z: Double) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
        self.z = CGFloat(z)
    }
    
    public var description: String {
        return "(\(x), \(y), \(z))"
    }
}
