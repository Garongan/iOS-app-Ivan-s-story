//
//  PersonalityDetailComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 15/05/25.
//

import SwiftUI

struct PersonalityDetailComponent: View {
    @Environment(\.dismiss) private var dismiss
    
    var animation: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                
                LottieView(animationName: animation, loopMode: .loop)
                    .frame(width: 200, height: 200)
                    .cornerRadius(16)
                
                Spacer()
            }
            
            Text(title)
                .font(.title)
            
            Text(description)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
