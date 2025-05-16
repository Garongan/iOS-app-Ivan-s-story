//
//  StoryComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 09/05/25.
//

import SwiftUI

struct StoryComponent: View {
    var index: Int
    var asset: String

    
    var body: some View {
        VStack(spacing: 16)  {
            Image(asset)
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(16)
            
            AnimatedText(text: storyPages[index])
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(16)
            
            Spacer()
        }

    }
}

#Preview {
    IvanStoryDetailView()
}
