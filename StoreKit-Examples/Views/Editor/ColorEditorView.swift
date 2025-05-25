//
//  ColorsEditView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI

struct ColorEditorView: View {

    @Environment(StoreKitManager.self) var storeKitManager
    
    var body: some View {
        @Bindable var storeKitManager = storeKitManager
        return Form {
            Section {
                ColorPicker("Tint Color", selection: $storeKitManager.tintColor, supportsOpacity: true)
            } footer: {
                Text("The tint color is used as the background for confirmation buttons, and as borders in prominent control styles")
            }
            
            Section {
                ColorPicker("Foreground Color", selection: $storeKitManager.foregroundColor, supportsOpacity: false)
            } footer: {
                Text("The foreground color is for button titles")
            }
        }
        .formStyle(.grouped)
    }
}

#Preview(body: {
    NavigationView {
        ColorEditorView()
    }
    .environment(StoreKitManager())
})

