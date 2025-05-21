//  
//  Path.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation

public struct Path: Identifiable, Hashable, CustomStringConvertible {
    public var id: UUID
    
    public var source: Node
    public var destination: Node
    public var sequence: [Node]
    public var distance: Double
    
    public init(source: Node, destination: Node ) {
        self.id = UUID()
        self.source = source
        self.destination = destination
        self.sequence = []
        self.distance = 0.0
    }
    
    public static func == (lhs: Path, rhs: Path) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public var description: String {
        var ret = "\(source.name) -> \(destination.name); dist=\(distance); path = "
        for node in sequence {
            if node != sequence.first! {
                ret += " -> \(node.name)"
            } else {
                ret += "\(node.name)"
            }
        }
        return ret
    }
    
}
