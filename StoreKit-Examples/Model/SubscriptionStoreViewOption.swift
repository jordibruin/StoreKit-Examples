//
//  SubscriptionStoreViewOption.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI

enum SubscriptionStoreViewOption: String, Identifiable, CaseIterable, View {
    case basic
    case grouped
    case period
    case controlStyle
    
    var id: String { self.rawValue }
    
    var body: some View {
        switch self {
        case .basic:
            BasicSubscriptionStoreView()
        case .grouped:
            GroupedSubscriptionStoreView()
        case .period:
            PeriodGroupStoreView()
        case .controlStyle:
            ControlStyleView()
        }
    }
    
    var title: String {
        switch self {
        case .basic:
            "None"
        case .grouped:
            "Grouped"
        case .period:
            "Period"
        case .controlStyle:
            "Control Style"
        }
    }
}
