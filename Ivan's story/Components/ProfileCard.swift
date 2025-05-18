//
//  ProfileCard.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 13/05/25.
//

import SwiftUI

struct ProfileCard: View {    
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
                ForEach(personalties) { personalty in
                    PersonalityCardView(personality: personalty)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
