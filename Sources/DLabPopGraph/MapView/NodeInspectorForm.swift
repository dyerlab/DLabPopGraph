//
//  NodeInspectorForm.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import SwiftUI
import CoreLocation

struct NodeInspectorForm: View {
    @Environment(\.dismiss) var dismiss
    @Binding var node: Node
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            Form {
                TextField("Name", text: $node.name)
                TextField("Size", value: $node.size, formatter: NumberFormatter())
                ColorPicker("Color", selection: $node.color)
            }
            Spacer()
        }
    }
}

#Preview {
    NodeInspectorForm( node: .constant( Node( name: "BaC",
                                              size: 12.8707,
                                              color: Color.green,
                                              coordinate: CLLocationCoordinate2D( latitude: 26.59,
                                                                                  longitude: -111.79) ) ) )
}
