//
//  Edge.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation


public class Edge: Identifiable, Equatable, Hashable {
    
    public var id: UUID
    public var fromNode: UUID
    public var toNode: UUID
    public var weight: Double
    
    init(fromNode: Node, toNode: Node, weight: Double = 1.0 ) {
        self.id = UUID()
        self.fromNode = fromNode.id
        self.toNode = toNode.id
        self.weight = weight
    }
    
    public static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}






