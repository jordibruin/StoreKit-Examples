//
//  ContentView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 23/05/2025.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    
    @State var showCancellation = false
    @State var showPolicies = false
//    @State var showRedeemCode = false
    @State var showRestorePurchases = false
    @State var showSignInButton = false
    
    @State var primarySubscriptionStoreButtonLabel: SubscriptionStoreButtonLabel = .automatic
    @State var secondarySubscriptionStoreButtonLabel: SubscriptionStoreButtonLabel = .automatic
    
//    @State var subscriptionStoreControlBackground: SubscriptionStoreControlBackground = .automatic
    @State var subscriptionStoreControlBackground: BackgroundStyle = .background
    
//    @State var subscriptionStoreControlStyle: SubscriptionStoreControlStyle = .automatic
    @State private var selectedStyle: StoreControlStyleOption = .buttons
    
    enum StoreControlStyleOption: String, CaseIterable, Identifiable {
        case buttons
        case picker
        
        var id: String { rawValue }

        var style: any SubscriptionStoreControlStyle {
            switch self {
            case .buttons:
                ButtonsSubscriptionStoreControlStyle()
            case .picker:
                PickerSubscriptionStoreControlStyle()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
//            SubscriptionStoreView(groupID: "80040CF5", visibleRelationships: .all) {
//                Color.blue
//            }
            SubscriptionStoreView(groupID: "80040CF5")
                .storeButton(showCancellation ? .visible : .hidden, for: .cancellation)
                .storeButton(showPolicies ? .visible : .hidden, for: .policies)
//                .storeButton(showRedeemCode ? .visible : .hidden, for: .redeemCode)
                .storeButton(showRestorePurchases ? .visible : .hidden, for: .restorePurchases)
                .storeButton(showSignInButton ? .visible : .hidden, for: .signIn)
            
                .subscriptionStoreControlBackground(.gradientMaterial)
            
//                .subscriptionStoreControlStyle(selectedStyle.style())
//                .subscriptionStoreControlStyle(selectedStyle.style)
            
                .subscriptionStoreControlStyle(.buttons)
                
                .subscriptionStoreButtonLabel(primarySubscriptionStoreButtonLabel)
                .subscriptionStoreButtonLabel(secondarySubscriptionStoreButtonLabel)
            
            
            
                .inspector(isPresented: .constant(true)) {
                    VStack {
                        HStack {
                            Button {
                                
                            } label: {
                                Text("1")
                            }
                            Button {
                                
                            } label: {
                                Text("2")
                            }
                            Button {
                                
                            } label: {
                                Text("3")
                            }
                        }
                        Form {
                            Section {
                                Toggle(isOn: $showCancellation) {
                                    Text("Cancellation")
                                }
                                Toggle(isOn: $showPolicies) {
                                    Text("Policies")
                                }
                                //                            Toggle(isOn: $showRedeemCode) {
                                //                                Text("Redeem Code")
                                //                            }
                                Toggle(isOn: $showRestorePurchases) {
                                    Text("Restore Purchases")
                                }
                                Toggle(isOn: $showSignInButton) {
                                    Text("Sign In")
                                }
                            } header: {
                                Text("Store Buttons")
                            }
                            
                            subscriptionStoreButtonLabelSection
                            
//                            Section {
//                                Picker(selection: $subscriptionStoreControlBackground) {
////                                    ForEach(SubscriptionStoreControlBackground.allCases, id: \.self) { type in
////                                        Text("TESt")
////                                    }
//                                } label: {
//                                    Text("Secondary Label")
//                                }
//                            }
                        }
                    }
                }
        }
    }
    
    var subscriptionStoreButtonLabelSection: some View {
        Section {
            Picker(selection: $primarySubscriptionStoreButtonLabel) {
                ForEach(SubscriptionStoreButtonLabel.allCases, id: \.self) { type in
                    Text(nameFor(label: type))
                }
            } label: {
                Text("Primary Label")
            }
            
            Picker(selection: $secondarySubscriptionStoreButtonLabel) {
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
