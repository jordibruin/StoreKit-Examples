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
    
    var body: some View {
        NavigationStack {
            SubscriptionStoreView(groupID: "80040CF5")
                .storeButton(showCancellation ? .visible : .hidden, for: .cancellation)
                .storeButton(showPolicies ? .visible : .hidden, for: .policies)
//                .storeButton(showRedeemCode ? .visible : .hidden, for: .redeemCode)
                .storeButton(showRestorePurchases ? .visible : .hidden, for: .restorePurchases)
                .storeButton(showSignInButton ? .visible : .hidden, for: .signIn)
            

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
                            }
                        }
                    }
                }
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

#Preview {
    ContentView()
}


extension SubscriptionStoreButtonLabel {
    static var allCases: [SubscriptionStoreButtonLabel] {
        [.action, .automatic, .displayName, .multiline, .price, .singleLine]
    }
}
