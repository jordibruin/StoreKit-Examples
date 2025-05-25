//
//  MarketingViewMode.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI

enum MarketingViewMode: String, CaseIterable, Identifiable {
    case basic
    case blinkist
    
    var id: String { self.rawValue }
    
    var name: String {
        switch self {
        case .basic:
            "Basic"
        case .blinkist:
            "Blinkist"
        }
    }
    
    var explanation: String {
        switch self {
        case .basic:
            "The default marketing view"
        case .blinkist:
            "Blinkist Example which shows the timeline for the trial"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .basic:
            ZStack {
                LinearGradient(colors: [Color.blue, Color.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                Text("A very basic marketing view")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
            }
        case .blinkist:
            VStack {
                Text("Here is what will happen")
                Text("day 1")
                Text("day 5")
                Text("day 7")
            }
        }
    }
}
