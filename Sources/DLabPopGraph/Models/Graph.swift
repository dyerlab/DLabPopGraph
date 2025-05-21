//
//  Graph.swift
//  GraphVisualization
//
//  Created by Rodney Dyer on 5/21/25.
//

import SwiftUI
import Foundation
import CoreLocation

public class Graph: Identifiable, Hashable  {
    public var id: UUID
    public var nodes: [Node]
    public var edges: [Edge]
    
    public init(nodes: [Node] = [] , edges: [Edge] = []) {
        self.id = UUID()
        self.nodes = nodes
        self.edges = edges
    }
    
    public var cardinality: Int {
        return nodes.count
    }
    
    public static func == (lhs: Graph, rhs: Graph) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func nodeNamed(_ name: String ) -> Node? {
        return nodes.first(where: { $0.name == name } ) ?? nil
    }
        
    public func addNode(name: String, size: Double, color: Color ) {
        nodes.append( Node(name: name, size: size, color: color) )
    }
    
    public func addNode(name: String, size: Double, color: Color, coordinate: CLLocationCoordinate2D) {
        nodes.append( Node(name: name, size: size, color: color, coordinate: coordinate) )
    }
    
    
    public func addEdge( from: String, to: String, weight: Double, symmetric: Bool ) {
        if let node1 = self.nodeNamed(from),
           let node2 = self.nodeNamed(to) {
            self.addEdge(from: node1, to: node2, weight: weight, symmetric: symmetric)
        }
    }
    
    
    public func addEdge( from: Node, to: Node, weight: Double = 1.0, symmetric: Bool ) {
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
    
    
    /// Convience function to pass node names instead of node objects.
    /// - Returns: Path for the shortest path or nil i fno path exists
    public func shortestPath( from: String, to: String) -> Path? {
        if let start = self.nodeNamed(from),
           let end = self.nodeNamed(to) {
            return self.shortestPath(from: start, to: end)
        } else {
            return nil
        }
    }
    
    /// Implements Dijkstra's algorithm for shortest path in a directed graph with non-negative edge weights.
    /// - Returns: Path object for the shortest path, or nil if no path exists.
    public func shortestPath(from start: Node, to end: Node) -> Path? {
        var distances = [UUID: Double]()
        var previous = [UUID: UUID]()
        var unvisited = Set(nodes.map { $0.id })

        for node in nodes {
            distances[node.id] = Double.infinity
        }
        distances[start.id] = 0

        while let current = unvisited.min(by: { (distances[$0] ?? Double.infinity) < (distances[$1] ?? Double.infinity) }) {
            unvisited.remove(current)

            if current == end.id {
                var pathNodes: [Node] = []
                var nodeID: UUID? = end.id
                while let id = nodeID {
                    if let node = nodes.first(where: { $0.id == id }) {
                        pathNodes.insert(node, at: 0)
                    }
                    nodeID = previous[id]
                }
                var path = Path(source: start, destination: end)
                path.sequence = pathNodes
                path.distance = distances[end.id] ?? Double.infinity
                return path
            }

            let neighbors = edges.filter { $0.fromNode == current && unvisited.contains($0.toNode) }
            for edge in neighbors {
                let alt = (distances[current] ?? Double.infinity) + edge.weight
                if alt < (distances[edge.toNode] ?? Double.infinity) {
                    distances[edge.toNode] = alt
                    previous[edge.toNode] = current
                }
            }
        }

        return nil
    }
    
    
}






