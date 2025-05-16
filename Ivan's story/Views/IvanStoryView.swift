//
//  ContentView.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 07/05/25.
//

import SwiftUI

struct IvanStoryView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var isSlideUpRectangle: Bool = false
    @State private var isSlideUpCard: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        SlideShowComponent()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(.secondarySystemBackground))
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 16,
                                        topTrailingRadius: 16
                                    )
                                )
                                .offset(y: isSlideUpRectangle ? -24 : 200)
                                .opacity(isSlideUpRectangle ? 1 : 0)
                                .animation(.easeInOut(duration: 1), value: isSlideUpRectangle)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        isSlideUpRectangle = true
                                    }
                                }
                            
                            VStack {
                                ProfileCard()
                                
                                EnterStoryCardComponent()
                            }
                            .offset(y: isSlideUpCard ? -64 : 200)
                            .opacity(isSlideUpCard ? 1 : 0)
                            .animation(.easeInOut(duration: 1), value: isSlideUpCard)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    isSlideUpCard = true
                                }
                            }
                        }
                        
                    }
                    .navigationTitle("Ivan's Story")
                }
            }
            
        }
        .scrollContentBackground(.hidden)
        
    }
}


#Preview {
    IvanStoryView()
}
