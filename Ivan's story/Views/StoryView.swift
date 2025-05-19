//
//  StoryView.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 07/05/25.
//

import SwiftUI
import ConfettiSwiftUI
import VTabView

struct StoryView: View {
    @State private var currentPage = 0
    @State private var trigger: Int = 0
    
    var body: some View {
        ZStack {
            VTabView(selection: $currentPage)  {
                ForEach(0..<numberOfPages, id: \.self) { index in
                    StoryComponent(index: index, asset: "StorySet\(index)")
                }
                .onChange(of: currentPage) {
                    if (currentPage == numberOfPages - 1) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation) {
                            trigger = trigger + 1
                        }
                    }
                }
            }
            .tabViewStyle(.page)
            
            HStack {
                Spacer()
                
                CustomPageIndicatorComponent(numberOfPages: numberOfPages, currentPage: $currentPage)
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width)

        }
        .confettiCannon(trigger: $trigger, num: 100)
        .background(Color(.secondarySystemBackground))
        .safeAreaPadding()
    }
}

#Preview {
    StoryView()
}
