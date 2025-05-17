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
        ZStack {
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
            
            if !isChangeToMainView {
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + globalDelayAnimation * 3) {
                            isChangeToMainView = true
                        }
                    }
                    
            }
            
            if isChangeToMainView {
                MainView()
            }
        }
    }
}


#Preview {
    IvanStoryView()
}
