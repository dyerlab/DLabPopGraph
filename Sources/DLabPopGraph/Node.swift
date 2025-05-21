//
//  File.swift
//  GraphVisualization
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation
import SwiftUI

public class Node: Identifiable, Equatable, Hashable {
    
    public var id: UUID
    public var name: String
    public var size: Double
    public var color: Color
    
    public init(name: String, size: Double, color: Color = .red) {
        self.id = UUID()
        self.name = name
        self.size = size
        self.color = color
    }
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}



