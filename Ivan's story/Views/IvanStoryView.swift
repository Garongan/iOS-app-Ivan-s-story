//
//  ContentView.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 07/05/25.
//

import SwiftUI

struct IvanStoryView: View {
    @Environment(\.colorScheme) private var colorScheme
    let greeting = "Hello, I am"
    let name = "Ivan Sunjaya"
    let personalitys: [String: String] = [
        "😄": "Cheerfull",
        "😶": "Introvert",
        "⚽️": "Sports",
        "🇰🇷": "Korean"
    ]
    let caption = "I am a person who interested in sports and speak korean also in free time i do my hobby"
    let icons: [String] = ["soccerball", "person.wave.2"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        SlideShowComponent()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(.secondarySystemBackground))
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 16,
                                        topTrailingRadius: 16
                                    )
                                )
                                .offset(y: -24)
                            
                            VStack {
                                ProfileCard(
                                    greeting: greeting,
                                    name: name,
                                    caption: caption,
                                    personalitys: personalitys
                                )
                                
                                EnterStoryCardComponent()
                            }
                            .offset(y: -64)
                        }
                    }
                    .navigationTitle("Ivan's Story")
                }
            }
            
        }
        .scrollContentBackground(.hidden)
        
    }
}


#Preview {
    IvanStoryView()
}
