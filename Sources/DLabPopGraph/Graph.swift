//
//  Graph.swift
//  GraphVisualization
//
//  Created by Rodney Dyer on 5/21/25.
//

import SwiftUI
import SceneKit
import Foundation
import CoreLocation

// MARK: - Graph

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


// MARK: - Node

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






// MARK: - Edge
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






