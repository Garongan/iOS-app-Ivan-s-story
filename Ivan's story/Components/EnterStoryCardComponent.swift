//
//  StoryCardComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 13/05/25.
//

import SwiftUI

struct EnterStoryCardComponent: View {
    var body: some View {
        ButtonComponent(
            view: AnyView(
                VStack(spacing: 0) {
                    Image("Story1Banner")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                    
                    ZStack {
                        LinearGradient(
                            colors: [.blue, .cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .hueRotation(.degrees(45))
                        .ignoresSafeArea()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("See Ivan's story")
                                    .font(.headline)
                                
                                Text("Read the ivan's journey to get inspired! ")
                                    .font(.caption)
                            }
                            .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Image(
                                systemName: "chevron.right"
                            )
                            .foregroundStyle(.white)
                            
                        }
                        .padding()
                    }
                    
                }
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .padding()
                
            ),
            destination: AnyView(IvanStoryDetailView()),
            filled: false
        )
    }
}

#Preview {
    IvanStoryView()
}
