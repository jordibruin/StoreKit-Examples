//
//  StreamingPassLevel.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 23/05/2025.
//

import SwiftUI
import StoreKit

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
