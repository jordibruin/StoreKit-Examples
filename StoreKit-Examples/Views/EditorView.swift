//
//  EditorView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 23/05/2025.
//

import SwiftUI
import StoreKit

struct EditorView: View {

    @Environment(StoreKitManager.self) var storeKitManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        @Bindable var storeKitManager = storeKitManager
        Form {
            storeTypeSection
            buttonsSection
            subscriptionStoreButtonLabelSection
            colorSection
        }
        .toolbar {
            Button {
                dismiss()
            } label: {
                Text("Close")
            }
        }
        .navigationTitle("Editor")
    }
    
    var storeTypeSection: some View {
        @Bindable var storeKitManager = storeKitManager
        return Section {
            Picker(selection: $storeKitManager.subscriptionStoreViewOption) {
                ForEach(SubscriptionStoreViewOption.allCases) { option in
                    Text(option.rawValue).tag(option)
                }
            } label: {
                Text("Store Type")
            }
        } header: {
            Text("Store Type")
        }
    }
    
    var buttonsSection: some View {
        @Bindable var storeKitManager = storeKitManager
        return Section {
            Toggle(isOn: $storeKitManager.showCancellation) {
                Text("Cancellation")
            }
            
            Toggle(isOn: $storeKitManager.showPolicies) {
                Text("Policies")
            }
            
            Toggle(isOn: $storeKitManager.showRedeemCode) {
                Text("Redeem Code")
            }
            
            Toggle(isOn: $storeKitManager.showRestorePurchases) {
                Text("Restore Purchases")
            }
            
            Toggle(isOn: $storeKitManager.showSignInButton) {
                Text("Sign In")
            }
        } header: {
            Text("Store Buttons")
        }
    }
    
    var colorSection: some View {
        @Bindable var storeKitManager = storeKitManager
        return Section {
            ColorPicker("Tint Color", selection: $storeKitManager.tintColor, supportsOpacity: true)
            ColorPicker("Foreground Color", selection: $storeKitManager.foregroundColor, supportsOpacity: false)
        } header: {
            Text("Subscription Store Button Labels")
        }
    }
    
    var subscriptionStoreButtonLabelSection: some View {
        @Bindable var storeKitManager = storeKitManager
        return Section {
            Picker(selection: $storeKitManager.primarySubscriptionStoreButtonLabel) {
                ForEach(SubscriptionStoreButtonLabel.allCases, id: \.self) { type in
                    Text(nameFor(label: type))
                }
            } label: {
                Text("Primary Label")
            }
            
            Picker(selection: $storeKitManager.secondarySubscriptionStoreButtonLabel) {
                ForEach(SubscriptionStoreButtonLabel.allCases, id: \.self) { type in
                    Text(nameFor(label: type))
                }
            } label: {
                Text("Secondary Label")
            }
        } header: {
            Text("Subscription Store Button Labels")
        }
    }
    
    func nameFor(label: SubscriptionStoreButtonLabel) -> String {
        switch label {
        case .action:
            "Action"
        case .automatic:
            "Automatic"
        case .displayName:
            "Display Name"
        case .price:
            "Price"
        case .singleLine:
            "Singleline"
        case .multiline:
            "Multiline"
        default:
            "Unknown"
        }
    }
}
