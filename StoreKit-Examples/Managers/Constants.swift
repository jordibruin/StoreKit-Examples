//
//  Constants.swift
//  StoreKit-Examples
//
//  Created by Jordi Bruin on 23/05/2025.
//

struct Constants {
    static let groupID = "80040CF5"
    static let simpleGroupID = "7C334564"
    static let trialGroup = "302C06AC"
    
}

enum Feature: String, CaseIterable, Identifiable {
    case featureOne
    case featureTwo
    case featureThree
    case featureFour
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .featureOne:
            "Feature One"
        case .featureTwo:
            "Feature Two"
        case .featureThree:
            "Feature Three"
        case .featureFour:
            "Feature Four"
        }
    }
}
