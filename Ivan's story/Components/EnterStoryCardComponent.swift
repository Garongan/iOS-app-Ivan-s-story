//
//  StoryCardComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 13/05/25.
//

import SwiftUI

struct StoryCardComponent: View {
    var greeting: String
    var name: String
    var caption: String
    var personalitys: [String: String]
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            SlideShowComponent()
            
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(height: 250)
                    .blur(radius: 10)
                    .mask(LinearGradient(gradient: Gradient(colors: [colorScheme == .light ? .black : .white, .clear]),startPoint: .bottom,endPoint: .top))
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(greeting)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Text(name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Text(caption)
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        ForEach(Array(personalitys), id: \.key) { key, value in
                            TagComponent(icon: key, text: value)
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }
        .background(colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.7))
        .cornerRadius(8)
    }
}

