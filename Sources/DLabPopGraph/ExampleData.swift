//
//  File.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import SwiftUI
import Foundation
import CoreLocation


public extension Graph {
    
    static var smallGraph: Graph {
        let g = Graph()
        
        g.addNode(name: "A", size: 1.0, color: .red )
        g.addNode(name: "B", size: 1.0, color: .green )
        g.addNode(name: "C", size: 1.5, color: .blue )
        g.addNode(name: "D", size: 2.0, color: .orange )
        
        g.addEdge(from: "A", to: "B", weight: 1.0, symmetric: true )
        g.addEdge(from: "B", to: "C", weight: 2.0, symmetric: true )
        g.addEdge(from: "C", to: "A", weight: 3.0, symmetric: true )
        g.addEdge(from: "C", to: "D", weight: 4.0, symmetric: false )
        
        return g
    }
    
    static var lophoGraph: Graph {
        let g = Graph()
        
        g.addNode( name: "BaC", size: 12.8707, color: Color.green, coordinate: CLLocationCoordinate2D( latitude: 26.59,longitude: -111.79) )
        g.addNode( name: "Ctv", size: 3.381395, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 29.73,longitude: -114.72) )
        g.addNode( name: "LaV", size: 4.00305, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 24.04,longitude: -109.99) )
        g.addNode( name: "Lig", size: 5.0032, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 25.73,longitude: -111.27) )
        g.addNode( name: "PtC", size: 5.4503, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 24.19,longitude: -111.15) )
        g.addNode( name: "PtP", size: 11.3172, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 29.03,longitude: -113.9) )
        g.addNode( name: "SLG", size: 6.41525, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 29.59,longitude: -114.4) )
        g.addNode( name: "SnE", size: 12.53715, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 24.45,longitude: -110.7) )
        g.addNode( name: "SnF", size: 7.004, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 30.76,longitude: -114.73) )
        g.addNode( name: "SnI", size: 5.8391, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 27.29,longitude: -113.02) )
        g.addNode( name: "StR", size: 7.1324, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 24.91,longitude: -111.62) )
        g.addNode( name: "TsS", size: 5.9387, color: Color.red, coordinate: CLLocationCoordinate2D( latitude: 23.58,longitude: -110.34) )
        g.addNode( name: "CP", size: 7.8462, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 27.95,longitude: -110.66) )
        g.addNode( name: "LF", size: 6.06715, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 30.68,longitude: -112.27) )
        g.addNode( name: "PL", size: 7.1986, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 30.39,longitude: -112.58) )
        g.addNode( name: "SenBas", size: 10.27315, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 31.95,longitude: -112.87) )
        g.addNode( name: "Seri", size: 2.5, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 28.88,longitude: -111.96) )
        g.addNode( name: "SG", size: 11.73435, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 29.4,longitude: -112.05) )
        g.addNode( name: "SI", size: 11.84485, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 29.75,longitude: -112.5) )
        g.addNode( name: "SN", size: 8.64935, color: Color.blue, coordinate: CLLocationCoordinate2D( latitude: 28.82,longitude: -111.8) )
        g.addNode( name: "TS", size: 14.85345, color: Color.orange, coordinate: CLLocationCoordinate2D( latitude: 28.41,longitude: -111.37) )
        
        g.addEdge( from: "BaC", to: "LaV", weight: 9.052676, symmetric: true )
        g.addEdge( from: "BaC", to: "Lig", weight: 9.716150, symmetric: true )
        g.addEdge( from: "BaC", to: "PtP", weight: 12.382480, symmetric: true )
        g.addEdge( from: "BaC", to: "SnE", weight: 6.539983, symmetric: true )
        g.addEdge( from: "BaC", to: "SnI", weight: 7.922799, symmetric: true )
        g.addEdge( from: "BaC", to: "StR", weight: 6.957130, symmetric: true )
        g.addEdge( from: "BaC", to: "SenBas", weight: 6.766322, symmetric: true )
        g.addEdge( from: "Ctv", to: "PtP", weight: 2.655055, symmetric: true )
        g.addEdge( from: "Ctv", to: "SLG", weight: 1.383612, symmetric: true )
        g.addEdge( from: "Ctv", to: "SnF", weight: 2.696431, symmetric: true )
        g.addEdge( from: "Ctv", to: "SenBas", weight: 6.506860, symmetric: true )
        g.addEdge( from: "LaV", to: "Lig", weight: 12.072820, symmetric: true )
        g.addEdge( from: "LaV", to: "SnE", weight: 12.800170, symmetric: true )
        g.addEdge( from: "LaV", to: "SnF", weight: 8.491120, symmetric: true )
        g.addEdge( from: "LaV", to: "TsS", weight: 10.386880, symmetric: true )
        g.addEdge( from: "Lig", to: "PtC", weight: 8.267106, symmetric: true )
        g.addEdge( from: "Lig", to: "SnE", weight: 14.224830, symmetric: true )
        g.addEdge( from: "Lig", to: "SnI", weight: 9.273806, symmetric: true )
        g.addEdge( from: "Lig", to: "StR", weight: 9.026984, symmetric: true )
        g.addEdge( from: "PtC", to: "SnE", weight: 12.801840, symmetric: true )
        g.addEdge( from: "PtC", to: "StR", weight: 12.398590, symmetric: true )
        g.addEdge( from: "PtC", to: "TsS", weight: 11.938340, symmetric: true )
        g.addEdge( from: "PtP", to: "SnF", weight: 12.584040, symmetric: true )
        g.addEdge( from: "PtP", to: "SnI", weight: 13.984130, symmetric: true )
        g.addEdge( from: "PtP", to: "SenBas", weight: 2.984673, symmetric: true )
        g.addEdge( from: "SLG", to: "SnF", weight: 4.434012, symmetric: true )
        g.addEdge( from: "SLG", to: "SnI", weight: 6.568057, symmetric: true )
        g.addEdge( from: "SnE", to: "StR", weight: 2.999361, symmetric: true )
        g.addEdge( from: "SnE", to: "TsS", weight: 4.575605, symmetric: true )
        g.addEdge( from: "SnF", to: "SnI", weight: 7.570517, symmetric: true )
        g.addEdge( from: "SnI", to: "StR", weight: 9.946860, symmetric: true )
        g.addEdge( from: "StR", to: "TsS", weight: 4.821284, symmetric: true )
        g.addEdge( from: "StR", to: "SenBas", weight: 7.665717, symmetric: true )
        g.addEdge( from: "CP", to: "LF", weight: 10.137190, symmetric: true )
        g.addEdge( from: "CP", to: "Seri", weight: 9.111798, symmetric: true )
        g.addEdge( from: "CP", to: "SG", weight: 2.773351, symmetric: true )
        g.addEdge( from: "CP", to: "SN", weight: 3.988562, symmetric: true )
        g.addEdge( from: "CP", to: "TS", weight: 4.143565, symmetric: true )
        g.addEdge( from: "LF", to: "PL", weight: 4.269119, symmetric: true )
        g.addEdge( from: "LF", to: "SG", weight: 2.418533, symmetric: true )
        g.addEdge( from: "LF", to: "SI", weight: 2.854111, symmetric: true )
        g.addEdge( from: "PL", to: "SenBas", weight: 3.127624, symmetric: true )
        g.addEdge( from: "PL", to: "SG", weight: 9.176150, symmetric: true )
        g.addEdge( from: "PL", to: "SI", weight: 3.533888, symmetric: true )
        g.addEdge( from: "Seri", to: "SG", weight: 2.915417, symmetric: true )
        g.addEdge( from: "Seri", to: "SN", weight: 4.867766, symmetric: true )
        g.addEdge( from: "SG", to: "SI", weight: 3.414492, symmetric: true )
        g.addEdge( from: "SI", to: "SN", weight: 3.569675, symmetric: true )
        g.addEdge( from: "SI", to: "TS", weight: 3.837508, symmetric: true )
        g.addEdge( from: "SN", to: "TS", weight: 4.875340, symmetric: true )
        
        return g
    }
    
}
