//
//  Adjacency.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation
import DLabMatrix


public func AdjacentyMatrix( graph: Graph, weighed: Bool ) -> Matrix {
    let N = graph.cardinality
    let names = graph.nodes.compactMap( { $0.name } )
    let ret = Matrix(N, N, 0.0)
    ret.colNames = names
    ret.rowNames = names
    
    for edge in graph.edges {
        if let n1 = graph.node(id: edge.fromNode ),
           let n2 = graph.node(id: edge.toNode ),
           let idx1 = graph.nodes.firstIndex(of: n1),
           let idx2 = graph.nodes.firstIndex(of: n2) {
            if weighed {
                ret[idx1,idx2] = edge.weight
            } else {
                ret[idx1,idx2] = 1.0
            }
        }
    }
    
    return ret
}
