//
//  ContentView.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 07/05/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Image("ProfilePic")
                    .resizable()
                    .frame(height: 400)
                    .cornerRadius(8)
                
                Text("Hello, I am Ivan")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink("See my story", destination: IvanStoryDetail())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                                
            }
            .padding(16)
            .navigationTitle("Ivan's Story")
        }
    }
}

#Preview {
    ContentView()
}
