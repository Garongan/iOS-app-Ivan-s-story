//
//  CustomPageIndicatorComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 09/05/25.
//

import SwiftUI

struct CustomPageIndicatorComponent: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Button(action: {
                    withAnimation {
                        currentPage = index
                    }
                }) {
                    Capsule()
                        .fill(index == currentPage ? Color.accentColor : Color.gray)
                        .frame(width: 8, height: index == currentPage ? 20 : 8)
                        .animation(.easeInOut, value: currentPage)
                }
            }
        }
    }
}

#Preview {
    StoryView()
}
