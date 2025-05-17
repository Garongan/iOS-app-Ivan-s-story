//
//  SlideShowComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 08/05/25.
//

import SwiftUI

struct SlideShowComponent: View {
    let timer = Timer.publish(every: 3, on: .main, in: .common)
        .autoconnect()
    
    @State private var currentImageIndex: Int
    @Environment(\.colorScheme) private var colorScheme
    @State private var isOnStart: Bool = true
    @State var isShowGradient: Bool = false
    
    init () {
        currentImageIndex = images.count / 2
    }
    
    var body: some View {
        ZStack{
            TabView(selection: $currentImageIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 400)
            
            Spacer()
                .onReceive(timer) { _ in
                    withAnimation {
                        if isOnStart && currentImageIndex < images.count - 1 {
                            currentImageIndex += 1
                            if currentImageIndex == images.count - 1 {
                                isOnStart = false
                            }
                        } else if !isOnStart && (currentImageIndex != 0) {
                            currentImageIndex -= 1
                            if currentImageIndex == 0 {
                                isOnStart = true
                            }
                        }
                    }
                }
            
            LinearGradient(gradient: Gradient(colors: [colorScheme == .dark ? .white : .black, .clear]), startPoint: .bottom, endPoint: .top)
                .frame(height: 200)
                .offset(y: 200)
                .opacity(isShowGradient ? 1 : 0)
                .animation(.easeInOut, value: isShowGradient)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation * 3) {
                        isShowGradient = true
                    }
                }
        }
    }
}

#Preview {
    IvanStoryView()
}
