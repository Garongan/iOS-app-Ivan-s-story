//
//  TagComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 08/05/25.
//

import SwiftUI

struct TagComponent: View {
    var personality: Personality
    
    @State var shouldPresentSheet = false
    
    var body: some View {
        VStack{
            Image(systemName: personality.icon)
            
            Text(personality.label)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color.accentColor)
        .padding(4)
        .background(Color(.secondarySystemFill))
        .cornerRadius(8)
        .onTapGesture {
            shouldPresentSheet.toggle()
        }
        .sheet(isPresented: $shouldPresentSheet) {
            PersonalityDetailComponent(animation: personality.animation, title: personality.title, description: personality.description)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    IvanStoryView()
}
