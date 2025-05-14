//
//  TagComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 08/05/25.
//

import SwiftUI

struct TagComponent: View {
    var icon: String
    var text: String
    
    var body: some View {
        VStack{
            Text(icon)
                .font(.largeTitle)
            
            Text(text)
                .font(.caption2)
        }
        .frame(maxWidth: .infinity)
        .padding(4)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(8)
        
    }
}
