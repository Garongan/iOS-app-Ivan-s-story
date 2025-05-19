//
//  VerticalTabViewTest.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 19/05/25.
//

import SwiftUI

struct VerticalTabViewTest: View {
    @State private var currentPage = 0
    @State private var trigger: Int = 0
    
    var body: some View {
        TabView(selection: $currentPage)  {
            ForEach(0..<numberOfPages, id: \.self) { index in
                StoryComponent(index: index, asset: "StorySet\(index)")
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.leading)
            }
            .onChange(of: currentPage) {
                if (currentPage == numberOfPages - 1) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation) {
                        trigger = trigger + 1
                    }
                }
            }
            .rotationEffect(.degrees(-90))
        }
        .background(.red)
        .frame(width: UIScreen.main.bounds.height)
        .tabViewStyle(.page)
        .rotationEffect(.degrees(90))
    }
}

#Preview {
    VerticalTabViewTest()
}
