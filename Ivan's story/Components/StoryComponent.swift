//
//  StoryComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 09/05/25.
//

import SwiftUI

struct StoryComponent: View {
    var index: Int
    
    let storyPages: [String] = [
        "I’m a code lover who enjoys building, not designing — currently diving into Swift after PHP, JS, Python, and Java.",
        "Joining a campus organization for the first time taught me how to connect with people beyond the code.",
        "Silence is my coding zone, but when I need a vibe, I turn NIKI's albums in spotify, or Hospital Playlist in Netflix.",
        "My dream is to work at Google — to grow, be challenged, and create something meaningful.",
        "From introvert to communicator, I’m learning to step up, speak out, and own my journey.",
        "Congrats you already read the story!"
    ]
    
    var asset: String

    
    var body: some View {
        VStack{
            Image(asset)
                .resizable()
                .scaledToFit()
                .frame(height: 400)
            
            Spacer()
            
            GroupBox {
                Text(storyPages[index])
            }
            
            Spacer()

        }

    }
}

#Preview {
    IvanStoryView()
}
