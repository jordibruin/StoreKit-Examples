//
//  StoreButtonEditorView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI

struct StoreButtonEditorView: View {
    
    @Environment(StoreKitManager.self) var storeKitManager
    
    var body: some View {
        @Bindable var storeKitManager = storeKitManager
        return Form {
            Section {
                Toggle(isOn: $storeKitManager.showCancellation) {
                    Text("Cancellation")
                }
            } footer: {
                Text("Enable this to show an xmark button in the top right corner to let users close the storeview")
            }
            
            Section {
                Toggle(isOn: $storeKitManager.showPolicies) {
                    Text("Policies")
                }
            } footer: {
                Text("Enable this to show links to your Terms of Use and Privacy Policy")
            }
            
            Section {
                Toggle(isOn: $storeKitManager.showRedeemCode) {
                    Text("Redeem Code")
                }
            } footer: {
                Text("Enable this to show a button to let users redeem a promo code")
            }
             
            Section {
                Toggle(isOn: $storeKitManager.showRestorePurchases) {
                    Text("Restore Purchases")
                }
            } footer: {
                Text("Enable this to show a restore purchases button for users who purchased an IAP in the past which for some reason has not been restored properly")
            }
             
            Section {
                Toggle(isOn: $storeKitManager.showSignInButton) {
                    Text("Sign In")
                }
            } footer: {
                Text("Enable this to show a sign in button for users who are not logged in to their AppleID")
            }
        }
        .navigationTitle("Store Buttons")
    }
}

#Preview(body: {
    NavigationView {
        StoreButtonEditorView()
    }
    .environment(StoreKitManager())
})

