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
        ZStack(alignment: .topLeading) {
            storeKitManager.subscriptionStoreViewOption
            
            Button {
                showEditor.toggle()
            } label: {
                Image(systemName: "ellipsis.circle.fill")
                    .foregroundStyle(.white)
                    .font(.title)
                    .background(.thinMaterial)
            }
            .padding()
        }
        .sheet(isPresented: $showEditor) {
            EditorView()
                .environment(storeKitManager)
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
