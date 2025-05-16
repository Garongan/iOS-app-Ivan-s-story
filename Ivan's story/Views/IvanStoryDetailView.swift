//
//  IvanStoryDetail.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 07/05/25.
//

import SwiftUI
import ConfettiSwiftUI

struct IvanStoryDetailView: View {
    @State private var currentPage = 0
    @State private var trigger: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage, content: {
                ForEach(0..<6) { index in
                    StoryComponent(index: index, asset: "StorySet\(index)")
                }
                .onChange(of: currentPage) {
                    if (currentPage == 5) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            trigger = trigger + 1
                        }
                    }
                }
                
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            CustomPageIndicatorComponent(numberOfPages: 6, currentPage: $currentPage)
        }
        .confettiCannon(trigger: $trigger, num: 100)
        .background(Color(.secondarySystemBackground))
        .safeAreaPadding()
    }
}

#Preview {
    IvanStoryDetailView()
}
