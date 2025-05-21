//
//  File.swift
//  GraphVisualization
//
//  Created by Rodney Dyer on 5/21/25.
//

import SwiftUI
import Foundation

public class Graph: Identifiable, Hashable  {
    public var id: UUID
    public var nodes: [Node]
    public var edges: [Edge]
    
    public init(nodes: [Node] = [] , edges: [Edge] = []) {
        self.id = UUID()
        self.nodes = nodes
        self.edges = edges
    }
    
    public static func == (lhs: Graph, rhs: Graph) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func newNode(name: String, size: Double, color: Color ) {
        nodes.append( Node(name: name, size: size, color: color) )
    }
    
    public func newEdge( from: Node, to: Node, weight: Double = 1.0, symmetric: Bool = true ) {
        edges.append( Edge(fromNode: from, toNode: to, weight: weight ) )
        if symmetric {
            edges.append( Edge(fromNode: to, toNode: from, weight: weight ) )
        }
    }
    
    public func nodesForEdge(_ edge: Edge) -> [Node]? {
        if let node1 = nodes.first(where: { $0.id == edge.fromNode } ),
           let node2 = nodes.first(where: { $0.id == edge.toNode } ) {
            return [node1,node2]
        }
        return nil
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}


