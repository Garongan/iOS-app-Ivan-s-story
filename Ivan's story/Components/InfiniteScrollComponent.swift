//
//  InfiniteScrollComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 15/05/25.
//

import SwiftUI

struct InfiniteScrollComponent: View {
    let items: [String] = ["item1", "item2", "item3", "item4"]
    @State private var scrollOffset: CGFloat = 0
    @State private var currentIndex: Int = 0
    
    private let groupCount: Int = 3
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<groupCount, id: \.self) { group in
                        ForEach(items.indices, id: \.self) { index in
                            Text(items[index])
                                .frame(width: geometry.size.width - 60, height: 200)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                }
                .background(
                    GeometryReader { innerGeo in
                        Color.clear
                            .preference(
                                key: ScrollOffsetKey.self,
                                value: innerGeo.frame(in: .named("scroll")).origin.x
                            )
                    }
                )
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetKey.self) { offset in
                let itemWidth: CGFloat = geometry.size.width - 60 + 20
                let totalWidth = itemWidth * CGFloat(items.count * groupCount)
                
                if offset <= -totalWidth + 2 * itemWidth {
                    scrollOffset = -itemWidth * CGFloat(items.count)
                } else if offset >= -itemWidth {
                    scrollOffset = -itemWidth * CGFloat(items.count * (groupCount - 2))
                }
            }
        }
    }
    
    struct ScrollOffsetKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
}

#Preview {
    InfiniteScrollComponent()
}
