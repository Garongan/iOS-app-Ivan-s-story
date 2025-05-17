//
//  ContentView.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 07/05/25.
//

import SwiftUI

struct IvanStoryView: View {
    @State private var isShowCenterBanner: Bool = false
    @State private var isChangeToMainView: Bool = false
    
    var body: some View {
        NavigationStack {
            Image("ProfilePic2")
                .resizable()
                .scaledToFit()
                .padding()
                .opacity(isShowCenterBanner ? 1 : 0)
                .animation(.easeInOut, value: isShowCenterBanner)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation) {
                        isShowCenterBanner.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation * 2) {
                        isShowCenterBanner.toggle()
                    }
                }
                .navigationDestination(isPresented: $isChangeToMainView) {
                    MainView()
                }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: globalDelayAnimation * 2, repeats: false) { _ in
                isChangeToMainView = true
            }
        }
    }
}


#Preview {
    IvanStoryView()
}
