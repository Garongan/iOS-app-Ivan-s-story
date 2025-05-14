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
        HStack(alignment: VerticalAlignment.center) {
            if currentPage > 0 {
                Circle()
                    .overlay(content: {
                        Button(action: {
                            withAnimation {
                                currentPage = currentPage - 1 >= 0 ? currentPage - 1 : 0
                            }
                        }){
                            Image(systemName: "chevron.left")
                                .symbolEffect(.bounce.up.byLayer, options: .nonRepeating, value: currentPage)
                        }
                        .foregroundStyle(.white)

                    })
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.accentColor)
                
                Spacer()
            } else {
                Spacer()
            }
            
            ForEach(0..<numberOfPages, id: \.self) { index in
                Button(action: {
                    withAnimation {
                        currentPage = index
                    }
                }) {
                    Capsule()
                        .fill(index == currentPage ? Color.accentColor : Color.gray)
                        .frame(width: index == currentPage ? 20 : 8, height: 8)
                        .animation(.easeInOut, value: currentPage)
                }
            }
            
            if currentPage < (numberOfPages - 1) {
                Spacer()
                
                Circle()
                    .overlay(content: {
                        Button(action: {
                            withAnimation {
                                currentPage = currentPage + 1 <= (numberOfPages - 1) ? currentPage + 1 : (numberOfPages - 1)
                            }
                        }){
                            Image(systemName: "chevron.right")
                                .symbolEffect(.bounce.up.byLayer, options: .nonRepeating, value: currentPage)
                        }
                        .foregroundStyle(.white)

                    })
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.accentColor)
                
                
            } else {
                Spacer()
            }
        }
        .padding()
    }
}
