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

