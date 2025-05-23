//
//  ContentView.swift
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
    
}

struct BasicSubscriptionStoreView: View {
    var body: some View {
        SubscriptionStoreView(groupID: "80040CF5")
    }
}

struct GroupedSubscriptionStoreView: View {
    
    @Binding var storeKitManager: StoreKitManager
    
    var body: some View {
        SubscriptionStoreView(groupID: "80040CF5") {
            SubscriptionOptionGroupSet { product in
                StreamingPassLevel(product)
            } label: { product in
                Text(product.localizedTitle)
            } marketingContent: { product in
                product.marketingContent
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

struct EditorView: View {

    @Binding var storeKitManager: StoreKitManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        @Bindable var storeKitManager = storeKitManager
        NavigationView {
            Form {
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
    }
    
    var buttonsSection: some View {
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

struct ContentView: View {
    
    @State var storeKitManager = StoreKitManager()
    @State var showEditor = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            GroupedSubscriptionStoreView(storeKitManager: $storeKitManager)
            
            Button {
                showEditor.toggle()
            } label: {
                Image(systemName: "star.fill")
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            .padding()
        }
        .sheet(isPresented: $showEditor) {
            EditorView(storeKitManager: $storeKitManager)
        }
        //
        //        NavigationStack {
        ////            SubscriptionStoreView(groupID: "80040CF5", visibleRelationships: .all) {
        ////                Color.blue
        ////            }
        //            GroupedSubscriptionStoreView()
        ////            SubscriptionStoreView(groupID: "80040CF5")
        //                .storeButton(storeKitManager.showCancellation ? .visible : .hidden, for: .cancellation)
        //                .storeButton(storeKitManager.showPolicies ? .visible : .hidden, for: .policies)
        ////                .storeButton(showRedeemCode ? .visible : .hidden, for: .redeemCode)
        //                .storeButton(storeKitManager.showRestorePurchases ? .visible : .hidden, for: .restorePurchases)
        //                .storeButton(storeKitManager.showSignInButton ? .visible : .hidden, for: .signIn)
        //
        //                .subscriptionStoreControlBackground(.gradientMaterial)
        //
        ////                .subscriptionStoreControlStyle(selectedStyle.style())
        ////                .subscriptionStoreControlStyle(selectedStyle.style)
        //
        //                .subscriptionStoreControlStyle(.buttons)
        //
        //                .subscriptionStoreButtonLabel(storeKitManager.primarySubscriptionStoreButtonLabel)
        //                .subscriptionStoreButtonLabel(storeKitManager.secondarySubscriptionStoreButtonLabel)
        //
        //
        //
        //                .inspector(isPresented: .constant(true)) {
        //                    VStack {
        //                        HStack {
        //                            Button {
        //
        //                            } label: {
        //                                Text("1")
        //                            }
        //                            Button {
        //
        //                            } label: {
        //                                Text("2")
        //                            }
        //                            Button {
        //
        //                            } label: {
        //                                Text("3")
        //                            }
        //                        }
        //                        Form {
        //                            Section {
        //                                Toggle(isOn: $storeKitManager.showCancellation) {
        //                                    Text("Cancellation")
        //                                }
        //                                Toggle(isOn: $storeKitManager.showPolicies) {
        //                                    Text("Policies")
        //                                }
        //                                //                            Toggle(isOn: $showRedeemCode) {
        //                                //                                Text("Redeem Code")
        //                                //                            }
        //                                Toggle(isOn: $storeKitManager.showRestorePurchases) {
        //                                    Text("Restore Purchases")
        //                                }
        //                                Toggle(isOn: $storeKitManager.showSignInButton) {
        //                                    Text("Sign In")
        //                                }
        //                            } header: {
        //                                Text("Store Buttons")
        //                            }
        //
        //                            subscriptionStoreButtonLabelSection
        //
        ////                            Section {
        ////                                Picker(selection: $subscriptionStoreControlBackground) {
        //////                                    ForEach(SubscriptionStoreControlBackground.allCases, id: \.self) { type in
        //////                                        Text("TESt")
        //////                                    }
        ////                                } label: {
        ////                                    Text("Secondary Label")
        ////                                }
        ////                            }
        //                        }
        //                    }
        //                }
        //        }
    }
    
    
    
  
    
    var backgroundStyles: [BackgroundStyle] {
        return [.background]
    }
}

#Preview {
    ContentView()
    //        .frame(height: 800)
    //        .previewDevice("iPhone 15 Pro")
}


extension SubscriptionStoreButtonLabel {
    static var allCases: [SubscriptionStoreButtonLabel] {
        [.action, .automatic, .displayName, .multiline, .price, .singleLine]
    }
}

enum StreamingPassLevel: Hashable {
    case basic
    case premium
    
    init(_ product: Product) {
        if product.id.contains("basic") {
            self = .basic
        } else {
            self = .premium
        }
    }
    
    var localizedTitle: String {
        switch self {
        case .basic:
            "Basic"
        case .premium:
            "Premium"
        }
    }
    
    @ViewBuilder
    var marketingContent: some View {
        ZStack {
            switch self {
            case .basic:
                Color.blue
            case .premium:
                Color.orange
            }
            
            Text(localizedTitle)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
        }
        .edgesIgnoringSafeArea(.top)
    }
}
