//
//  ContentView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 23/05/2025.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    
    @State var storeKitManager = StoreKitManager()
    @State var showEditor = false
    
    var body: some View {
        Group {
            if UIDevice.current.userInterfaceIdiom == .pad {
                storeKitManager.subscriptionStoreViewOption
                    .inspector(isPresented: .constant(true)) {
                        EditorView()
                    }
            } else {
                ZStack(alignment: .topTrailing) {
                    storeKitManager.subscriptionStoreViewOption
                    
                    Button {
                        showEditor.toggle()
                    } label: {
                        Text("Edit")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    .padding(.top, -60)
                    .padding(.trailing)
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showEditor) {
            NavigationView {
                EditorView()
                    .environment(storeKitManager)
            }
        }
        .environment(storeKitManager)
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
