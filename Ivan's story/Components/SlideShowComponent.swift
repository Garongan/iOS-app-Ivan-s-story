//
//  SlideShowComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 08/05/25.
//

import SwiftUI

struct SlideShowComponent: View {
    @State private var currentImageIndex: Int = 0
    @Environment(\.colorScheme) private var colorScheme
    
    @State var images = ["ProfilePic1", "ProfilePic2", "ProfilePic3"]
    let timer = Timer.publish(every: 5, on: .main, in: .common)
        .autoconnect()
    
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
                        currentImageIndex = (currentImageIndex + 1) % images.count
                    }
                }
            
            LinearGradient(gradient: Gradient(colors: [colorScheme == .dark ? .white : .black, .clear]), startPoint: .bottom, endPoint: .top)
                .frame(height: 200)
                .offset(y: 200)
        }
    }
}

#Preview {
    IvanStoryView()
}
