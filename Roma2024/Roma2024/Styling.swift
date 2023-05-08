//
//  Styling.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import Foundation
import SwiftUI

extension Color {
    static let primaryBackground = Color("PrimaryBackground")
    static let secondaryBackground = Color("SecondaryBackground")
    static let primaryDetail = Color("PrimaryDetail")
    static let hyperAccent = Color("HyperAccent")
    static let primaryHeadline = Color("PrimaryHeadline")
    static let secondaryHeadline = Color("SecondaryHeadline")
    static let body = Color("Body")
}

/// Modifier to style the buttons of the floating menu
/// Tied to the expand Bool value, defines the offset of the button
struct ExpandMenu: ViewModifier {
    
    let expand: Bool
    let offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(expand ? 0.1 : 0.0), radius: 10, x: 0, y: 5)
            .offset(y: expand ? offset : 0)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5), value: expand)
    }
}

extension View {
    /// Adds the modifier to the button of the extended menu
    /// Specifies the expand bool and the offset of the button
    func expandMenu(_ expand: Bool, offset: CGFloat) -> some View {
        modifier(ExpandMenu(expand: expand, offset: offset))
    }
}

