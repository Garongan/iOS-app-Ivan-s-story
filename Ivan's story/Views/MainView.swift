//
//  MainView.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 17/05/25.
//

import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var isSlideUpRectangle: Bool = false
    @State private var isSlideUpCard: Bool = false
    @State private var isShowSlideShow: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        SlideShowComponent()
                            .offset(y: isShowSlideShow ? 0 : 100)
                            .opacity(isShowSlideShow ? 1 : 0)
                            .animation(.easeInOut, value: isShowSlideShow)
                            .onAppear() {
                                DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation * 2) {
                                    isShowSlideShow.toggle()
                                }
                            }
                        
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
                                    DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation * 2) {
                                        isSlideUpRectangle.toggle()
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
                                DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation * 3) {
                                    isSlideUpCard.toggle()
                                }
                            }
                        }
                        
                    }
                    .navigationTitle("Ivan's Story")
                }
            }
            
        }
        .scrollContentBackground(.hidden)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
