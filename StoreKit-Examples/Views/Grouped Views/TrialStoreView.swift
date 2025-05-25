//
//  PeriodGroupStoreView 2.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI
import StoreKit

struct TrialStoreView: View {
    
    @Environment(StoreKitManager.self) var storeKitManager
    
    var body: some View {
        SubscriptionStoreView(groupID: Constants.trialGroup) {
            SubscriptionPeriodGroupSet { period in
                Color.blue
            }
        }
        .subscriptionStoreControlStyle(.compactPicker, placement: .buttonsInBottomBar)
        .tint(storeKitManager.tintColor)
        .foregroundStyle(storeKitManager.foregroundColor)
        
        // Buttons
        .storeButton(storeKitManager.showCancellation ? .visible : .hidden, for: .cancellation)
        .storeButton(storeKitManager.showPolicies ? .visible : .hidden, for: .policies)
        .storeButton(storeKitManager.showRedeemCode ? .visible : .hidden, for: .redeemCode)
        .storeButton(storeKitManager.showRestorePurchases ? .visible : .hidden, for: .restorePurchases)
        .storeButton(storeKitManager.showSignInButton ? .visible : .hidden, for: .signIn)
        
        // Subscription Store Button Labels
        .subscriptionStoreButtonLabel(storeKitManager.primarySubscriptionStoreButtonLabel)
        .subscriptionStoreButtonLabel(storeKitManager.secondarySubscriptionStoreButtonLabel)
    }
}

