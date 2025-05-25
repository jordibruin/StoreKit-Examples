//
//  StoreKitManager.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 23/05/2025.
//

import SwiftUI
import StoreKit

@Observable
class StoreKitManager {
    
    var showCancellation = true
    var showRestorePurchases = false
    var showSignInButton = false
    var showRedeemCode = false
    var showPolicies = false
    
    var primarySubscriptionStoreButtonLabel: SubscriptionStoreButtonLabel = .automatic
    var secondarySubscriptionStoreButtonLabel: SubscriptionStoreButtonLabel = .automatic
    
    var tintColor: Color = .green
    var foregroundColor: Color = .primary
    
    var subscriptionStoreViewOption: SubscriptionStoreViewOption = .grouped
    
    var marketingViewMode: MarketingViewMode = .basic
        
    var controlStyle: ControlStyle = .automatic
    
}

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
