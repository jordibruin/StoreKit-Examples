//
//  BadgedPickerControlStyle.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//


import StoreKit
import SwiftUI

struct BadgedPickerControlStyle: SubscriptionStoreControlStyle {
    func makeBody(configuration: Configuration) -> some View {
        SubscriptionPicker(configuration) { option in
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(option.displayName)
                        .font(.title2)
                    
                    if option.isFamilyShareable {
                        FamilyShareableBadge()
                    } else {
                        Text("Not Family Shareable")
                            .foregroundStyle(.red)
                    }
                    Text(option.description)
                }
                Spacer()
            }
        } confirmation: { option in
            //            CustomConfirmationButton()
            SubscribeButton(option)
        }
    }
}

struct FamilyShareableBadge: View {
    var body: some View {
        Text("Family Shareable")
    }
}
