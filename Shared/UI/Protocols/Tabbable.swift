//
//  Tabbable.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI

/// Protocol for state, which screen will be displayed in a tabview
public protocol Tabbable: AnyObject, Identifiable {
    
//    associatedtype Screen: View
    
    var tabTitle: String { get }
    var tabImage: String { get }
    
    var screen: AnyView { get }
}
