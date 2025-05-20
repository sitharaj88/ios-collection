//
//  ContentView.swift
//  NotificationBadge
//
//  Created by Sitharaj Seenivasan on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var badgeCount: Int = UIApplication.shared.applicationIconBadgeNumber
    var body: some View {
        VStack {
            Text("Badge Count \(badgeCount)")
                .font(.largeTitle)
            HStack(spacing: 40) {
                Button(action: incrementBadgeCount) {
                    Label("+ Increment", systemImage: "plus.circle")
                        .font(.title2)
                }
                
                Button(action: decrementBadgeCount) {
                    Label("- Decrement", systemImage: "minus.circle")
                        .font(.title2)
                }
            }
        }
        .padding()
    }
    
    private func updateBadgeCount(to newValue: Int) {
        let clamped = max(0, newValue)
        badgeCount = clamped
        DispatchQueue.main.async {
            UIApplication.shared.applicationIconBadgeNumber = clamped
        }
    }
    
    private func incrementBadgeCount() {
        updateBadgeCount(to: badgeCount + 1)
    }
    
    private func decrementBadgeCount() {
        updateBadgeCount(to: badgeCount - 1)
    }
}

#Preview {
    ContentView()
}
