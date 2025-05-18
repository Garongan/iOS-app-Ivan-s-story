//
//  AnimatedText.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 16/05/25.
//

import SwiftUI

struct AnimatedText: View {
    var text: String
    @State private var displayedText: String = ""
    @State private var characterIndex: Int = 0
    @State private var timer: Timer?
    
    var body: some View {
        Text(displayedText)
            .multilineTextAlignment(.leading)
            .onAppear{
                startTyping()
            }
            .onDisappear {
                timer?.invalidate()
            }
            
    }
    
    func startTyping() {
        displayedText = ""
        characterIndex = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if self.characterIndex < self.text.count {
                let index = text.index(text.startIndex, offsetBy: characterIndex)
                displayedText.append(text[index])
                characterIndex += 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
}

#Preview {
    StoryView()
}
