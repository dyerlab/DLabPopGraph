//
//  Test.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Testing
import DLabPopGraph


struct PathTests {

    @Test func emptyPath() async throws {
        let g = Graph()
        let p = g.shortestPath(from: "A", to: "B")
        #expect( p == nil, "not nil path from empty graph")
        
    }
    
    @Test func lophoPaths() async throws {
        
        let graph = Graph.lophoGraph
        
        let dist1 = try #require( graph.shortestPath(from: "BaC", to: "LaV"))
        #expect( dist1.distance == 9.052676, "BaC to LaV not correct." )
        print( dist1 )
        
        let dist2 = try #require( graph.shortestPath(from: "LaV", to: "BaC"))
        #expect( dist2.distance == 9.052676, "LaV to BaC not correct." )
        print( dist2 )
        
        #expect( dist1.distance == dist2.distance, "Symmetrical distances are not equal.")
        
        let dist3 = try #require( graph.shortestPath(from: "BaC", to: "BaC"))
        #expect( dist3.distance == 0.0, "BaC to BaC not correct." )
        print( dist3 )
        
        let dist4 = try #require( graph.shortestPath(from: "TsS", to: "Lig"))
        #expect( dist4.distance == (4.821284 + 9.026984), "TsS to Lig not correct." )
        print( dist4 )
        
       
        
    }

}
