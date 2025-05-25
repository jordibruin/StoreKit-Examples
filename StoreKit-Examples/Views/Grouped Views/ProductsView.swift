//
//  ProductsView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI
import StoreKit

struct ProductsView: View {
    @Environment(StoreKitManager.self) var storeKitManager
    
    var body: some View {
        ScrollView {
            ProductView(id: "simple.monthly", prefersPromotionalIcon: false)
            ProductView(id: "simple.monthly", prefersPromotionalIcon: true)
        }
    }
}

#Preview(body: {
    ProductsView()
        .environment(StoreKitManager())
})


