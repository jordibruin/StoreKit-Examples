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
            
            if storeKitManager.subscriptionStoreViewOption == .controlStyle {
                controlStylePicker
            }
            
            buttonsNavigationLink
            subscriptionStoreButtonLabelSection
            colorSection
        }
        .formStyle(.grouped)
        .toolbar {
            Button {
                dismiss()
            } label: {
                Text("Close")
            }
            .opacity(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 1)
        }
        .navigationTitle("Editor")
    }
    
//    var subscriptionOptionGroupStyleSection: some View {
//        @Bindable var storeKitManager = storeKitManager
//        Picker(selection: $storeKitManager.subscriptionOptionGroupStyle) {
//            Text("Test")
//        } label: {
//            Text("Subscription Option Group Style")
//        }
//
//    }
    
    var storeTypeSection: some View {
        @Bindable var storeKitManager = storeKitManager
        return Section {
            Picker(selection: $storeKitManager.subscriptionStoreViewOption) {
                ForEach(SubscriptionStoreViewOption.allCases) { option in
                    Text(option.rawValue).tag(option)
                }
            } label: {
                Text("Product Group")
            }
            
            if storeKitManager.subscriptionStoreViewOption == .basic {
                marketingViewSection
            }
        } header: {
            Text("Product Grouping")
        }
    }
    
    @ViewBuilder
    var controlStylePicker: some View {
        @Bindable var storeKitManager = storeKitManager
        Section {
            Picker(selection: $storeKitManager.controlStyle) {
                ForEach(ControlStyle.allCases) { style in
                    Text(style.title).tag(style)
                }
            } label: {
                Text("Control Style")
            }
        }
    }
    
    var buttonsNavigationLink: some View {
        NavigationLink {
            buttonsSection
        } label: {
            Text("Store Buttons")
        }

    }
    var buttonsSection: some View {
        @Bindable var storeKitManager = storeKitManager
        return Form {
            Section {
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
    
    @ViewBuilder
    var marketingViewSection: some View {
        @Bindable var storeKitManager = storeKitManager
        Picker(selection: $storeKitManager.marketingViewMode) {
            ForEach(MarketingViewMode.allCases) { mode in
                Text(mode.name).tag(mode)
            }
        } label: {
            Text("Marketing View Mode")
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
            Text("A very basic marketing view")
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
