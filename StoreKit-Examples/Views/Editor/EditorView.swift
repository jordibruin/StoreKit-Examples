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
            
            colorsNavigationLink
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
    
    var storeTypeSection: some View {
        @Bindable var storeKitManager = storeKitManager
        return Section {
            Picker(selection: $storeKitManager.subscriptionStoreViewOption) {
                ForEach(SubscriptionStoreViewOption.allCases) { option in
                    Text(option.title).tag(option)
                }
            } label: {
                Text("Product Group")
            }
            .pickerStyle(.navigationLink)
            
            marketingViewSection
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
            StoreButtonEditorView()
        } label: {
            Text("Store Buttons")
        }
    }
    
    var colorsNavigationLink: some View {
        NavigationLink {
            ColorEditorView()
        } label: {
            HStack {
                Text("Colors")
                Spacer()
                
                HStack(spacing: -6) {
                    Circle()
                        .foregroundStyle(storeKitManager.tintColor)
                        .frame(width: 26, height: 26)
                    
                    Circle()
                        .foregroundStyle(storeKitManager.foregroundColor)
                        .frame(width: 26, height: 26)
                }
            }
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
        .pickerStyle(.navigationLink)
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

#Preview(body: {
    NavigationView {
        EditorView()
    }
    .environment(StoreKitManager())
})
