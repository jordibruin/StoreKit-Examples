//
//  GridView.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 25/05/2025.
//

import SwiftUI

struct GridView: View {
    
    @State var showInspector = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 400, maximum: 800)),
                    GridItem(.adaptive(minimum: 400, maximum: 800)),
                ]) {
                    BasicSubscriptionStoreView()
                        .border(Color.gray, width: 1)
                        .shadow(radius: 1)
                        .frame(height: 600)
                    
                    GroupedSubscriptionStoreView()
                        .border(Color.gray, width: 1)
                        .shadow(radius: 3)
                        .frame(height: 600)
                    
                    PeriodGroupStoreView()
                        .border(Color.gray, width: 1)
                        .shadow(radius: 3)
                        .frame(height: 600)
                    
                    GroupedSubscriptionStoreView()
                        .border(Color.gray, width: 1)
                        .shadow(radius: 3)
                        .frame(height: 600)
                }
                .padding()
            }
            
            .navigationTitle("All StoreView Styles")
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        showInspector.toggle()
                    } label: {
                        Text("Editor")
                    }
                }
            })
            .inspector(isPresented: $showInspector) {
                NavigationStack {
                    EditorView()
                }
                .environment(StoreKitManager())
            }
        }
        
        .environment(StoreKitManager())
    }
}

#Preview {
    GridView()
}
