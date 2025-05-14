//
//  ProfileCard.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 13/05/25.
//

import SwiftUI

struct ProfileCard: View {
    var greeting: String
    var name: String
    var caption: String
    var personalitys: [String: String]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text(greeting)
                    .font(.headline)
                
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(caption)
                    .font(.caption)
            }
            
            HStack {
                ForEach(Array(personalitys), id: \.key) { key, value in
                    TagComponent(icon: key, text: value)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}
