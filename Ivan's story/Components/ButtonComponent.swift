//
//  ButtonComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 08/05/25.
//

import SwiftUI

struct ButtonComponent: View {
    var view: AnyView
    var destination: AnyView
    var filled: Bool = true
    var fillWidth: CGFloat?
    
    var body: some View {
        NavigationLink(destination: destination) {
            view
        }
        .frame(maxWidth: fillWidth)
        .background(filled ? Color.accentColor : Color.clear)
        
    }
}

#Preview {
    ContentView()
}
