//
//  Test.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import SwiftUI
import Testing
import DLabPopGraph

struct GraphTests {

    @Test func graphConstruction() async throws {
        
        let G = Graph()
        
        #expect(G.cardinality == 0, "Failed cardinality" )
        #expect(G.nodeNamed("Bob") == nil, "Failed empty node access.")
        
        G.addNode(name: "Bob", size: 12.2, color: .red)
        #expect(G.cardinality == 1, "Failed cardinality, G=1" )
        
    }

}
