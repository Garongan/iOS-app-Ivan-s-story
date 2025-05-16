//
//  InfiniteScrollComponent.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 15/05/25.
//

import SwiftUI

class Store: ObservableObject {
    @Published var items: [MyApps]
    
    init() {
        self.items = myapps
    }
}

struct MyApps: Identifiable {
    var id: Int
    var name: String
    var icon: String
}

let myapps: [MyApps] = [
    MyApps(id: 0, name: "Photoshop", icon: "psl"),
    MyApps(id: 1, name: "Adobe Illustrator", icon: "ail"),
    MyApps(id: 2, name: "Premiere", icon: "prl"),
    MyApps(id: 3, name: "After Effect", icon: "ael"),
    MyApps(id: 4, name: "Figma", icon: "fig"),
    MyApps(id: 5, name: "Media Bang", icon: "mbl"),
    MyApps(id: 6, name: "Blender", icon: "ble"),
    MyApps(id: 7, name: "Canva", icon: "can"),
]

struct Selector: View {
    
    @StateObject var store = Store()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var activeIndex: Int = 0
    @State var appName: String = ""
    
    var body: some View {
        
        ZStack {
            ForEach(store.items) { item in
                
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.blue)
                        .shadow(radius: 5)
                    Text(item.name)
                        
                }
                .frame(width: 150, height: 150)
                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                .opacity(1.0 - abs(distance(item.id)) * 0.3 )
                .offset(x: myXOffset(item.id), y: 0)
                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                .onTapGesture {
                    withAnimation {
                        draggingItem = Double(item.id)
                    }
                    self.appName = store.items[item.id].name
                }
                
            }
        }
        .gesture(getDragGesture())
        .onAppear {
            if store.items.indices.contains(0) {
                appName = store.items[0].name
            }
        }
        Text(appName)
            .padding(.top)
            .font(.headline)
    }
    
    private func getDragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                draggingItem = snappedItem + value.translation.width / 100
            }
            .onEnded { value in
                withAnimation {
                    draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                    draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                    snappedItem = draggingItem
                    
                    // Get active index
                    self.activeIndex = store.items.count + Int(draggingItem)
                    
                    
                    // Basically, if its more than the stored count, reset to 1
                    // Simple way of making it infinite
                    if self.activeIndex > store.items.count || Int(draggingItem) >= 0 {
                        self.activeIndex = Int(draggingItem)
                    }
                    self.appName = store.items[self.activeIndex].name
                }
            }
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 1.2 / Double(store.items.count) * distance(item)
        return sin(angle) * 200
    }
}

#Preview {
    Selector()
}
