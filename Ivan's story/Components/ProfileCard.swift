//
//  ProfileCard.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 13/05/25.
//

import SwiftUI

struct Personality: Identifiable {
    let id: UUID = UUID()
    let animation: String
    let icon: String
    let label: String
    let title: String
    let description: String
}

struct ProfileCard: View {
    var greeting: String
    var name: String
    var caption: String
    let personalties: [Personality] = [
        Personality(animation: "smile-animated", icon: "face.smiling.inverse", label: "Cheerfull", title: "My personality", description: "Always full of positive energy, my friend lights up every room with their cheerful spirit. Their smile is contagious, their laughter sincere the kind of person who makes even ordinary moments feel joyful and bright."),
        Personality(animation: "eksplorer-animated", icon: "figure.hiking.circle.fill", label: "Eksplorer", title: "I'd love to explore", description: "My friend is someone with a curious spirit always eager to explore new things, from places and stories to ideas and perspectives. For them, each day is an opportunity to discover something inspiring and see the world in a different light."),
        Personality(animation: "sports-animated", icon: "soccerball", label: "Sports", title: "Im interested in sports", description: "Passionate about sports, my friend thrives on the energy, discipline, and excitement that come with every game. Whether it's playing on the field or following their favorite team, sports are more than just a hobby they're a way to stay active, connected, and inspired."),
        Personality(animation: "korean-animated", icon: "globe", label: "Korean", title: "I'm currently learning Korean", description: "With a love for language and culture, my friend enjoys learning Korean not just the words, but the stories, expressions, and traditions behind them. For them, studying Korean is a fun and meaningful way to connect with a whole new world.")
    ]

    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text(greeting)
                    .font(.headline)
                
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(caption)
                    .font(.caption)
            }
            
            HStack {
                ForEach(personalties) { personalty in
                    PersonalityCardView(personality: personalty)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    IvanStoryView()
}
