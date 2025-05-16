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
