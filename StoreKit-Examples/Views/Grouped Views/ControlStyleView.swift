//
//  ControlStyleView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI
import StoreKit

enum ControlStyle: String, CaseIterable, Identifiable, View  {
    case automatic
    case compactPicker
    case buttons
    case pagedPicker
    case pagedProminentPicker
    case picker
    case prominentPicker
    case custom
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .automatic: "Automatic"
        case .compactPicker: "Compact Picker"
        case .buttons: "Buttons"
        case .pagedPicker: "Paged Picker"
        case .pagedProminentPicker: "Paged Prominent Picker"
        case .picker: "Picker"
        case .prominentPicker: "ProminentPicker"
        case .custom: "Custom"
        }
    }
    
    var body: some View {
        switch self {
        case .automatic:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
                .subscriptionStoreControlStyle(.automatic, placement: .automatic)
        case .compactPicker:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
                .subscriptionStoreControlStyle(.compactPicker, placement: .automatic)
        case .buttons:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
                .subscriptionStoreControlStyle(.buttons)
        case .pagedPicker:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
            .subscriptionStoreControlStyle(.pagedPicker, placement: .buttonsInBottomBar)
        case .pagedProminentPicker:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
                .subscriptionStoreControlStyle(.pagedProminentPicker, placement: .buttonsInBottomBar)
        case .picker:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
                .subscriptionStoreControlStyle(.picker, placement: .buttonsInBottomBar)
        case .prominentPicker:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
                .subscriptionStoreControlStyle(.prominentPicker, placement: .buttonsInBottomBar)
        case .custom:
            SubscriptionStoreView(groupID: Constants.simpleGroupID)
                .subscriptionStoreControlStyle(BadgedPickerControlStyle())
        }
    }
}

struct ControlStyleView: View {
    @Environment(StoreKitManager.self) var storeKitManager
    
    var body: some View {
        storeKitManager.controlStyle
    }
}


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
//            FamilyShareableBadge()
          }
          Text(option.description)
        }
        Spacer()
//        SelectionIndicator(pickerOption.isSelected)
      }
    } confirmation: { option in
      SubscribeButton(option)
    }
  }
}
