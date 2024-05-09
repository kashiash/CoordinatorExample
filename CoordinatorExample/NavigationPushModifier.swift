//
//  NavigationPushModifier.swift
//  CoordinatorExample
//
//  Created by Jacek Kosinski U on 09/05/2024.
//

import Foundation
import SwiftUI

struct NavigationPushModifier<Destination  : View> : ViewModifier {

    

    @Binding var isPresented: Bool
    @ViewBuilder var destination: () -> Destination
    var onDismiss: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .navigationDestination(isPresented: $isPresented, destination: destination)
            .onChange(of: isPresented ){ _, newValue in
                if !newValue {
                    onDismiss?()
                }

            }
    }

}

extension View {
    func push<Destination: View>(isPresented: Binding<Bool>,
                                 onDismiss: (() -> Void)? = nil,
                                 @ViewBuilder destination: @escaping () -> Destination) ->
    some View {
        self.modifier(NavigationPushModifier(isPresented: isPresented,
                                             destination: destination,
                                             onDismiss: onDismiss))
    }
}
