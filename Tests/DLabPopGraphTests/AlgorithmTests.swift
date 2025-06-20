//
//  Test.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Testing
import DLabPopGraph
import DLabMatrix

struct Test {

    @Test func AdjacencyTests() async throws {
        let g = Graph.smallGraph
        
        
        let a = AdjacentyMatrix(graph: g, weighed: false )
        #expect(a.rows == a.cols, "Adjacency matrix not square" )
        #expect(a.rows == g.cardinality, "Adjacency matrix incorrect size" )
        
        
        let A1 = Matrix( 4, 4, 0 )
        A1[0,1] = 1.0; A1[1,0] = 1.0
        A1[0,2] = 1.0; A1[2,0] = 1.0
        A1[1,2] = 1.0; A1[2,1] = 1.0
        A1[2,4] = 1.0
        
        // A --- B
        //  \   /
        //    C
        //    |
        //    D
        #expect( a == A1, "Adjacency matrix incorrect")
        print(a)

        
        let A2 = Matrix( 4, 4, 0 )
        A2[0,1] = 1.0; A2[1,0] = 1.0
        A2[0,2] = 2.0; A2[2,0] = 2.0
        A2[1,2] = 3.0; A2[2,1] = 3.0
        A2[2,4] = 4.0
        
        let b = AdjacentyMatrix(graph: g, weighed: true )
        
        #expect( b == A2, "Weighted adjacency matrix incorrect")
        print(A2)

    }
    
    @Test func DegreeCentralityTests() async throws {
        let g = Graph.smallGraph
        
        let v = OutDegreeCentrality(graph: g)
        #expect(v.isEmpty == false, "Vector created incorrectly")
        #expect(v[0] == 2.0, "Degree centrality incorrect")
        #expect(v[1] == 2.0, "Degree centrality incorrect")
        #expect(v[2] == 3.0, "Degree centrality incorrect")
        #expect(v[3] == 0.0, "Degree centrality incorrect")
        
    }
    
    @Test func InDegreeCentralityTests() async throws {
        let g = Graph.smallGraph
        
        let v = InDegreeCentrality(graph: g)
        #expect(v.isEmpty == false, "Vector created incorrectly")
        #expect(v[0] == 2.0, "Degree centrality incorrect")
        #expect(v[1] == 2.0, "Degree centrality incorrect")
        #expect(v[2] == 2.0, "Degree centrality incorrect")
        #expect(v[3] == 1.0, "Degree centrality incorrect")
        
    }

    
    
    @Test func TotalDegreeCentralityTests() async throws {
        let g = Graph.smallGraph
        
        let v = TotalDegreeCentrality(graph: g)
        #expect(v.isEmpty == false, "Vector created incorrectly")
        #expect(v[0] == 4.0, "Degree centrality incorrect")
        #expect(v[1] == 4.0, "Degree centrality incorrect")
        #expect(v[2] == 5.0, "Degree centrality incorrect")
        #expect(v[3] == 1.0, "Degree centrality incorrect")
        
    }

    
    @Test func ClosenessCentralityTests() async throws {
        let g = Graph.smallGraph
        let v = ClosenessCentrality(graph: g)
        
        print("\(v.description)")
        
        #expect( v == [0.25, 0.25, 1.0/3.0, 0.2 ],  "Closeness centrality incorrect")
        
    }

    
    
    @Test func BetweennessCentralityTests() async throws {
        let g = Graph.smallGraph
        let v = BetweennessCentrality(graph: g)
        
        #expect( v == [0.0, 0.0, 1.0/3.0, 0.0], "Betweenness centrality incorrect" )
        print("\(v.description)")
    }
    
    
    @Test func EigenvectorCentralityTests() async throws {
        let g = Graph.smallGraph
        if let v = EigenvectorCentrality(graph: g) {
            print("\(v.description)")
        }
        
        
    }
    
}
